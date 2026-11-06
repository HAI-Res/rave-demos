# Sourced by every job in train/. Everything lives on hai-res shared (scratch-fast is over quota).
export R=/data/hai-res/shared/jonmyers/rave-birds
export CORPUS=/data/scratch/jonmyers/concatenator/corpus/macaulay-birdsong
export PATH=/data/scratch/jonmyers/bin:$R/.venv/bin:$PATH      # static ffmpeg/uv, then the venv
export UV_CACHE_DIR=$R/.cache/uv UV_PYTHON_INSTALL_DIR=/data/hai-res/shared/jonmyers/uv-python
export XDG_CACHE_HOME=$R/.cache MPLCONFIGDIR=$R/.cache/mpl NUMBA_CACHE_DIR=$R/.cache/numba TORCH_HOME=$R/.cache/torch
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-4}
