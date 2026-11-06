#!/bin/bash
#SBATCH --job-name=rave-birds-smoke
#SBATCH --account=hai-res --qos=hai-res-main --partition=hai-res-l40s
#SBATCH --gres=gpu:l40s:2 --cpus-per-task=16 --mem=48G --time=00:40:00
#SBATCH --output=/data/hai-res/shared/jonmyers/rave-birds/logs/smoke_%j.out
#SBATCH --error=/data/hai-res/shared/jonmyers/rave-birds/logs/smoke_%j.out
# Does RAVE v2 train under DDP across the VAE->GAN switch? 30 files, 2 GPUs, phase 1 = 150 steps.
set -euo pipefail
source /data/hai-res/shared/jonmyers/rave-birds/train/env.sh
cd $R
echo "host $(hostname) | gpu ${CUDA_VISIBLE_DEVICES:-none} | $(date)"
mkdir -p data/smoke_in runs_smoke; rm -rf runs_smoke/* data/lmdb_smoke
for f in $(ls $CORPUS | head -30); do ln -sf $CORPUS/$f data/smoke_in/$f; done
rave preprocess --input_path data/smoke_in --output_path data/lmdb_smoke --channels 1 --sampling_rate 44100 --max_db_size 2
echo 150 > runs_smoke/smoke.phase1
export RAVE_DDP_GPUS=2
python -u train/train_wrap.py --config v2 --name smoke --db_path data/lmdb_smoke --out_path runs_smoke \
  --max_steps 600 --val_every 200 --batch 16 --channels 1 --workers 6 --progress=false
echo SMOKE_EXIT $?
ls -la runs_smoke/smoke_*/version_*/checkpoints/
