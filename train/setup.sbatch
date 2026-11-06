#!/bin/bash
#SBATCH --job-name=rave-birds-setup
#SBATCH --account=csail --qos=tig-main --partition=tig-cpu
#SBATCH --cpus-per-task=8 --mem=16G --time=01:00:00
#SBATCH --output=/data/hai-res/shared/jonmyers/rave-birds/logs/setup_%j.out
#SBATCH --error=/data/hai-res/shared/jonmyers/rave-birds/logs/setup_%j.out
# Python 3.10: acids-rave 2.3 pins scipy==1.10 and pytorch_lightning==1.9, so torch 2.0.1 (cu118, runs on L40S).
set -euo pipefail
source /data/hai-res/shared/jonmyers/rave-birds/train/env.sh
cd $R
scontrol update JobId=$SLURM_JOB_ID Comment="progress=0% installing acids-rave 2.3" || true
[ -d src/BRAVE ] || git clone -q https://github.com/fcaspe/BRAVE src/BRAVE
(cd src/BRAVE && git rev-parse --short HEAD) > src/BRAVE_REV
[ -x .venv/bin/python ] || uv venv -q -p 3.10 .venv
VIRTUAL_ENV=$R/.venv uv pip install --index-strategy unsafe-best-match \
  --extra-index-url https://download.pytorch.org/whl/cu118 \
  torch==2.0.1 torchaudio==2.0.2 "numpy<2" acids-rave==2.3.0 h5py soundfile
.venv/bin/python -c "import torch, rave, gin; print('torch', torch.__version__, 'rave ok')"
.venv/bin/pip freeze > logs/pip_freeze.txt 2>/dev/null || VIRTUAL_ENV=$R/.venv uv pip freeze > logs/pip_freeze.txt
scontrol update JobId=$SLURM_JOB_ID Comment="progress=100% done" || true
echo SETUP_OK
