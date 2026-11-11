#!/bin/bash
# Handoff for the finished bird model (run on Jon's Mac, in the background):
#   1. wait until training has reached MAX_STEPS (train.sbatch then writes runs/STOP_v2),
#   2. submit the export job (4 and 16 dims, streaming, load-checked),
#   3. copy birds_z4.ts / birds_z16.ts into rave/,
#   4. replace those two files and rave-demos-everything.zip on the models-v1 release,
#      so get-models.sh and the zip both serve the final models.
# Stops (with a notification) at the first problem; never retries ssh auth more than 3 times.
#   usage: nohup dev/train/final.sh > dev/train/final.log 2>&1 &
set -uo pipefail
REPO=/Users/jon/Documents/2026/MIT/projects/rave-demos
R=/data/hai-res/shared/jonmyers/rave-birds
RUN=$R/runs/birds_v2_gated_d49defb5f2
say() { echo "$(date '+%m-%d %H:%M:%S') $*"; }
die() { say "STOPPED: $*"; osascript -e "display notification \"$*\" with title \"rave-birds final\"" 2>/dev/null; exit 1; }
rssh() { ssh -o BatchMode=yes -o ConnectTimeout=20 agents "$@" 2>&1 | grep -v -e 'Permission denied' -e bashrc; return ${PIPESTATUS[0]}; }
fails=0
retry() { fails=$((fails+1)); say "ssh failed ($fails)"; [ $fails -ge 3 ] && die "ssh to agents failed 3 times; not retrying (auth?)"; sleep $((300*fails)); }

say "waiting for training to finish ($RUN)"
while :; do
  out=$(rssh "test -e $R/runs/STOP_v2 && echo done || cat $R/runs/birds_v2_gated.step") || { retry; continue; }
  fails=0
  [ "$out" = done ] && break
  say "step $out"
  sleep 900
done
say "training finished; waiting 5 min for the last checkpoint to settle"
sleep 300

JOB=$(rssh "sbatch --parsable --export=ALL,RUN=$RUN,TAG=birds $R/train/export.sbatch") || die "export sbatch failed: $JOB"
JOB=$(echo "$JOB" | tail -1)
say "export job $JOB"
while :; do
  st=$(rssh "squeue -h -j $JOB -o %T 2>/dev/null") || { retry; continue; }
  fails=0
  [ -z "$st" ] && break
  sleep 120
done
state=$(rssh "sacct -n -X -j $JOB -o State%20" | tr -d ' ')
say "export job $JOB ended: $state"
rssh "tail -c 3000 $R/logs/export_$JOB.out"
[ "$state" = COMPLETED ] || die "export job $JOB ended $state"
rssh "grep -q 'birds_z4.ts: methods' $R/logs/export_$JOB.out && grep -q 'birds_z16.ts: methods' $R/logs/export_$JOB.out" || die "export log lacks the load checks"

for N in 4 16; do
  rsync -a --partial agents:$R/export/birds_z$N.ts "$REPO/rave/birds_z$N.ts.part" && mv "$REPO/rave/birds_z$N.ts.part" "$REPO/rave/birds_z$N.ts" || die "copy of birds_z$N.ts failed"
  sz=$(stat -f %z "$REPO/rave/birds_z$N.ts"); [ "$sz" -gt 50000000 ] || die "birds_z$N.ts is only $sz bytes"
  say "copied birds_z$N.ts ($sz bytes)"
done

# rebuild the everything-zip: main as committed, plus all 11 models (IRCAM's from the release)
B=$(mktemp -d); mkdir -p "$B/models"
cd "$B/models" && gh release download models-v1 -R HAI-Res/rave-demos -p '*.ts' || die "release download failed"
cp "$REPO/rave/birds_z4.ts" "$REPO/rave/birds_z16.ts" "$B/models/"
cd "$REPO" && git archive --prefix=rave-demos/ main | tar -x -C "$B" || die "git archive failed"
cp "$B"/models/*.ts "$B/rave-demos/rave/"
[ "$(ls "$B"/rave-demos/rave/*.ts | wc -l)" -eq 11 ] || die "zip would not have 11 models"
cd "$B" && zip -qr -0 rave-demos-everything.zip rave-demos || die "zip failed"
gh release upload models-v1 -R HAI-Res/rave-demos --clobber \
  "$REPO/rave/birds_z4.ts" "$REPO/rave/birds_z16.ts" "$B/rave-demos-everything.zip" || die "release upload failed"
rm -rf "$B"
say "DONE: final bird models (export job $JOB) are in rave/ and on the models-v1 release"
osascript -e 'display notification "final bird models exported and on the release" with title "rave-birds final"' 2>/dev/null
