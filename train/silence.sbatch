#!/bin/bash
#SBATCH --job-name=rave-birds-silence
#SBATCH --account=csail --qos=tig-main --partition=tig-cpu
#SBATCH --cpus-per-task=48 --mem=48G --time=02:00:00
#SBATCH --output=/data/hai-res/shared/jonmyers/rave-birds/logs/silence_%j.out
#SBATCH --error=/data/hai-res/shared/jonmyers/rave-birds/logs/silence_%j.out
# Per-file level stats over the 940-file Macaulay corpus, plus a gated copy in data/gated/.
set -euo pipefail
source /data/hai-res/shared/jonmyers/rave-birds/train/env.sh
cd $R
echo "host $(hostname) | cpus $SLURM_CPUS_PER_TASK | $(date) | rev $(cat train/GIT_REV 2>/dev/null)"
python -I train/silence.py "$CORPUS" data --gate-db 30 --workers $SLURM_CPUS_PER_TASK
scontrol update JobId=$SLURM_JOB_ID Comment="progress=100% done" || true
