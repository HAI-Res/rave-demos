#!/bin/bash
#SBATCH --job-name=rave-birds-preprocess
#SBATCH --account=hai-res --qos=hai-res-main --partition=hai-res-l40s
#SBATCH --cpus-per-task=16 --mem=32G --time=06:00:00
#SBATCH --output=/data/hai-res/shared/jonmyers/rave-birds/logs/preprocess_%j.out
#SBATCH --error=/data/hai-res/shared/jonmyers/rave-birds/logs/preprocess_%j.out
# One `rave preprocess` serves both RAVE v2 and BRAVE (both 44.1 kHz mono).
# SRC (export before sbatch): gated = data/gated (silence.py output), raw = the mp3 corpus.
set -euo pipefail
source /data/hai-res/shared/jonmyers/rave-birds/train/env.sh
cd $R
SRC=${SRC:-gated}
IN=$([ "$SRC" = raw ] && echo "$CORPUS" || echo "$R/data/gated")
OUT=$R/data/lmdb_$SRC
echo "host $(hostname) | $(date) | rev $(cat train/GIT_REV 2>/dev/null) | $IN -> $OUT"
scontrol update JobId=$SLURM_JOB_ID Comment="progress=0% rave preprocess $SRC" || true
rm -rf "$OUT"
rave preprocess --input_path "$IN" --output_path "$OUT" --channels 1 --sampling_rate 44100 --max_db_size 60
du -sh "$OUT"
scontrol update JobId=$SLURM_JOB_ID Comment="progress=100% done" || true
