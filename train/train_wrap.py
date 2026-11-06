"""`rave train` with one extra Lightning callback.

The callback writes the global step to runs/<name>.step (so the chained job knows when
training is finished) and publishes progress to the cluster-status page. Everything else
is acids-rave 2.3's own scripts/train.py, unchanged; the arguments are its flags.
"""
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pytorch_lightning as pl                                     # noqa: E402
from absl import app                                               # noqa: E402

try:
    from hai_res_progress import report
except Exception:
    def report(*a, **k): return False


def flag(name, default=None):
    for i, a in enumerate(sys.argv):
        if a == f"--{name}" and i + 1 < len(sys.argv):
            return sys.argv[i + 1]
        if a.startswith(f"--{name}="):
            return a.split("=", 1)[1]
    return default


NAME, OUT = flag("name"), flag("out_path", "runs/")
TOTAL = int(flag("max_steps", 6000000))
STEP_FILE = os.path.join(OUT, f"{NAME}.step")
# Phase-1 length can be changed while training runs: write a step count to runs/<name>.phase1.
# WarmupCallback compares its step counter with pl_module.warmup on every batch.
PHASE1_FILE = os.path.join(OUT, f"{NAME}.phase1")
NGPU = int(os.environ.get("RAVE_DDP_GPUS", "1"))


class Progress(pl.Callback):
    def __init__(self):
        self.t0, self.s0, self.last = time.time(), None, 0

    def on_train_batch_end(self, trainer, pl_module, *args, **kwargs):
        s = trainer.global_step
        if self.s0 is None:
            self.s0 = s
        if time.time() - self.last < 60:
            return
        self.last = time.time()
        try:
            p1 = int(open(PHASE1_FILE).read().strip())
            if p1 != pl_module.warmup:
                print(f"[progress] phase 1 length {pl_module.warmup} -> {p1}", flush=True)
                pl_module.warmup = p1
        except (OSError, ValueError):
            pass
        if not trainer.is_global_zero:
            return
        with open(STEP_FILE, "w") as f:
            f.write(str(s))
        rate = (s - self.s0) / max(time.time() - self.t0, 1)
        eta = (TOTAL - s) / rate if rate > 0 else None
        phase = "VAE" if not getattr(pl_module, "warmed_up", False) else "GAN"
        report(s / TOTAL, step=s, total=TOTAL, msg=f"{NAME} {phase} {rate:.1f}it/s", eta_seconds=eta)
        print(f"[progress] step {s}/{TOTAL} {phase} {rate:.2f} it/s", flush=True)

    def on_train_end(self, trainer, pl_module):
        if not trainer.is_global_zero:
            return
        with open(STEP_FILE, "w") as f:
            f.write(str(trainer.global_step))


_init = pl.Trainer.__init__


def _patched(self, *a, callbacks=None, **kw):
    callbacks = list(callbacks or []) + [Progress()]
    if NGPU > 1:
        # RAVE uses manual optimization; the discriminator gets no gradient in phase 1,
        # and the encoder none in phase 2, so DDP must look for unused parameters.
        from pytorch_lightning.strategies import DDPStrategy
        kw["strategy"] = DDPStrategy(find_unused_parameters=True)
        kw["accelerator"] = "gpu"
        kw["devices"] = NGPU
    _init(self, *a, callbacks=callbacks, **kw)


pl.Trainer.__init__ = _patched

if __name__ == "__main__":
    from scripts import train
    # sys.argv[0] stays this file's path: DDP relaunches the other ranks with it.
    app.run(train.main)
