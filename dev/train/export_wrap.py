"""`rave export` (acids-rave 2.3) with the number of latent dimensions forced.

2.3's export has no flag for the latent count: VariationalScriptedRAVE takes
argmax(cumulative PCA variance > --fidelity), rounded UP to a power of two. Its
post_process_latent then projects z onto the PCA basis computed during phase 1
(latent_pca, latent_mean buffers in the checkpoint), so z1 is the direction of most
variance, and pre_process_latent fills the dropped dimensions with fresh N(0,1) noise
every frame. That holds for BRAVE too when exported this way: BRAVE trains with plain
rave.RAVE + VariationalEncoder, so the same PCA is computed; only BRAVE's own plugin
exporter (export_brave_plugin.py) bypasses it.

--force_latent N replaces the fidelity rule with N (rounded up to a power of two by the
same code). Every other flag is rave export's own, e.g.
    python export_wrap.py --run runs/birds_v2_gated_xxx --streaming=true --force_latent 4 \
        --name birds_v2_z4 --output out/
It also prints the checkpoint's cumulative fidelity curve.
"""
import sys

from absl import app, flags

flags.DEFINE_integer("force_latent", None, "number of latent dimensions to export")

if __name__ == "__main__":
    from scripts import export
    import numpy as np

    class _NP:
        """numpy, except argmax, which export calls only for the fidelity cut."""
        def __getattr__(self, k): return getattr(np, k)

        def argmax(self, a, *x, **k):
            fid = None
            try:
                fid = np.asarray(a)
            except Exception:
                pass
            n = flags.FLAGS.force_latent
            print("fidelity mask (cumvar > threshold):", None if fid is None else fid.astype(int)[:32])
            return np.argmax(a, *x, **k) if n is None else n

    export.np = _NP()
    _orig = export.VariationalScriptedRAVE.__init__ if hasattr(export, "VariationalScriptedRAVE") else None

    def _show(self, pretrained, *a, **k):
        f = pretrained.fidelity.numpy()
        print("cumulative PCA variance, dims 1-16:", " ".join(f"{v:.3f}" for v in f[:16]))
        for p in (.8, .9, .95, .99):
            print(f"  dims for {p:.0%}: {int(np.argmax(f > p)) + 1}")
        _orig(self, pretrained, *a, **k)
        print("exported latent_size:", self.latent_size)

    if _orig:
        export.VariationalScriptedRAVE.__init__ = _show
    sys.argv[0] = export.__name__
    app.run(export.main)
