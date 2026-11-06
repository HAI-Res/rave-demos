#!/bin/bash
#SBATCH --job-name=rave-birds-export
#SBATCH --account=hai-res --qos=hai-res-main --partition=hai-res-l40s
#SBATCH --cpus-per-task=8 --mem=24G --time=00:45:00
#SBATCH --output=/data/hai-res/shared/jonmyers/rave-birds/logs/export_%j.out
#SBATCH --error=/data/hai-res/shared/jonmyers/rave-birds/logs/export_%j.out
# Export a run at 4 and 16 latent dims for nn~ (streaming), then load each .ts and report
# its methods, latent size, hop and a decode timing. RUN, TAG (export before sbatch).
set -euo pipefail
source /data/hai-res/shared/jonmyers/rave-birds/train/env.sh
cd $R
RUN=${RUN:?}; TAG=${TAG:?}; OUT=$R/export; mkdir -p $OUT
echo "host $(hostname) | $(date) | rev $(cat train/GIT_REV) | run $RUN"
# Training may still be writing checkpoints: freeze the newest one that is >2 min old, with its
# config.gin, into export_src/$TAG and export from there.
SNAP=$R/export_src/$TAG; rm -rf $SNAP; mkdir -p $SNAP
CK=$(find $RUN -name "*.ckpt" -mmin +2 -printf "%T@ %p\n" | sort -n | tail -1 | cut -d" " -f2)
[ -n "$CK" ] || { echo "no checkpoint older than 2 min in $RUN"; exit 1; }
cp "$(find $RUN -name config.gin | head -1)" $SNAP/config.gin
cp "$CK" $SNAP/model.ckpt
python -c "import torch; c=torch.load('$SNAP/model.ckpt', map_location='cpu'); print('checkpoint', '$CK', 'global_step', c.get('global_step'), 'epoch', c.get('epoch'))"
for N in 4 16; do
  python -u train/export_wrap.py --run $SNAP/model.ckpt --streaming=true --force_latent $N --name ${TAG}_z$N --output $OUT
  mv -f $OUT/${TAG}_z${N}_streaming.ts $OUT/${TAG}_z$N.ts
done
python -u - <<PY
import glob, time, torch
for p in sorted(glob.glob("$OUT/${TAG}_z*.ts")):
    m = torch.jit.load(p).eval()
    names = [n for n in ("encode","decode","forward") if hasattr(m, n)]
    hop = int(m.encode_params[3]) if hasattr(m, "encode_params") else None
    dz = int(m.decode_params[0]) if hasattr(m, "decode_params") else None
    sr = int(m.sr) if hasattr(m, "sr") else None
    z = torch.randn(1, dz, 64)
    with torch.no_grad():
        m.decode(z); t = time.time(); y = m.decode(z); dt = time.time() - t
    print(f"{p.split('/')[-1]}: methods {names} latent {dz} hop {hop} sr {sr} -> {sr/hop:.2f} frames/s; "
          f"decode 64 frames = {64*hop/sr:.2f}s audio in {dt*1000:.0f} ms (8 cpu)  out {tuple(y.shape)}")
PY
ls -la $OUT
