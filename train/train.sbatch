#!/bin/bash
#SBATCH --job-name=rave-birds-train
#SBATCH --account=hai-res --qos=hai-res-main --partition=hai-res-l40s
#SBATCH --gres=gpu:l40s:4
#SBATCH --cpus-per-task=32 --mem=96G
#SBATCH --time=23:55:00
#SBATCH --output=/data/hai-res/shared/jonmyers/rave-birds/logs/train_%x_%j.out
#SBATCH --error=/data/hai-res/shared/jonmyers/rave-birds/logs/train_%x_%j.out
# MODEL (export before sbatch): v2 | brave.  SRC: gated | raw.  GPUS (DDP, default 4).  BATCH per GPU (16).
# Phase 1 (VAE) length is read live from runs/<name>.phase1 (see train_wrap.py), so it can be set
# from the measured speed without restarting. Latent PCA is refreshed at each validation in phase 1.
# The QOS caps a job at one day, so each job queues its successor (afterany) and resumes
# from the newest checkpoint. Stop the chain: touch $R/runs/STOP_<MODEL>.
# Schedule: 1M steps phase 1 (VAE) + 500k phase 2 (GAN), as in the BRAVE paper.
set -euo pipefail
source /data/hai-res/shared/jonmyers/rave-birds/train/env.sh
cd $R
MODEL=${MODEL:?set MODEL=v2 or brave}; SRC=${SRC:-gated}; MAX_STEPS=${MAX_STEPS:-1500000}; GPUS=${GPUS:-4}; BATCH=${BATCH:-16}
NAME=birds_${MODEL}_${SRC}
case $MODEL in
  v2)    CFG=(--config v2) ;;
  brave) CFG=(--config $R/src/BRAVE/configs/brave.gin) ;;
esac
ulimit -n "$(ulimit -Hn)" || true
echo "host $(hostname) | gpu ${CUDA_VISIBLE_DEVICES:-none} | $(date) | rev $(cat train/GIT_REV 2>/dev/null) | brave $(cat src/BRAVE_REV)"
[ -e runs/STOP_$MODEL ] && { echo "stop file present"; exit 0; }

RUN=$(ls -d runs/${NAME}_* 2>/dev/null | head -1 || true)
RESUME=(); [ -n "$RUN" ] && ls $RUN/version_*/checkpoints/*.ckpt >/dev/null 2>&1 && RESUME=(--ckpt "$RUN")
echo "run ${RUN:-new} ${RESUME[*]:-}"

# queue the successor now; it waits for this one and exits at once if training finished
export MODEL SRC MAX_STEPS GPUS BATCH RAVE_DDP_GPUS=$GPUS
NEXT=$(sbatch --parsable --job-name=$SLURM_JOB_NAME --dependency=afterany:$SLURM_JOB_ID $R/train/train.sbatch)
echo "successor $NEXT"

# progress (cluster-status page) and runs/<name>.step come from the callback in train_wrap.py
set +e
python -u $R/train/train_wrap.py "${CFG[@]}" --name $NAME --db_path $R/data/lmdb_$SRC --out_path $R/runs \
  --max_steps $MAX_STEPS --channels 1 --workers 6 --batch $BATCH --val_every 5000 --save_every 20000 --progress=false "${RESUME[@]}"
RC=$?
S=$(cat $R/runs/${NAME}.step 2>/dev/null || echo 0)
echo "exit $RC at step $S"
if [ "$S" -ge "$MAX_STEPS" ]; then touch runs/STOP_$MODEL; scancel $NEXT; scontrol update JobId=$SLURM_JOB_ID Comment="progress=100% done" || true; fi
exit $RC
