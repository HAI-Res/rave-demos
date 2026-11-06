#!/bin/bash
# Morning handoff for the overnight bird model (run on Jon's Mac, in the background):
#   1. wait for the cluster export job (submitted with --begin, so SLURM starts it on time
#      whatever happens to this Mac's ssh),
#   2. copy birds_z4.ts / birds_z16.ts into the repo's rave/ folder (*.ts is gitignored),
#   3. rebase the birds-models branch (menu entries + README) onto main, push, open a PR
#      and merge it, so the patch menus on GitHub list the two models.
# Nothing is pushed unless both models exported, loaded and copied.
#   usage: train/finish.sh EXPORT_JOB_ID
set -uo pipefail
REPO=/Users/jon/Documents/2026/MIT/projects/rave-demos
R=/data/hai-res/shared/jonmyers/rave-birds
JOB=${1:?export job id}
say() { echo "$(date '+%m-%d %H:%M:%S') $*"; }
die() { say "STOPPED: $*"; osascript -e "display notification \"$*\" with title \"rave-birds finish\"" 2>/dev/null; exit 1; }
rssh() { ssh -o ConnectTimeout=20 agents "$@" 2>&1 | grep -v 'Permission denied'; return ${PIPESTATUS[0]}; }

say "waiting for export job $JOB"
fails=0
while :; do
  # a finished job makes `squeue -j` print an error rather than nothing, so drop stderr
  st=$(rssh "squeue -h -j $JOB -o %T 2>/dev/null") || { fails=$((fails+1)); say "ssh failed ($fails)"; [ $fails -ge 3 ] && die "ssh to agents failed 3 times; not retrying (auth?)"; sleep $((120*fails)); continue; }
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

cd "$REPO" || die "no repo"
[ -z "$(git status --porcelain --untracked-files=no)" ] || die "repo has uncommitted changes; not touching git"
git checkout -q birds-models && git rebase -q main || die "rebase of birds-models onto main failed"
python3 dev/tools/gen_patches.py >/dev/null || die "gen_patches failed"
if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
  git commit -qam "Regenerate patches after rebase

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
fi
git push -q -u origin birds-models || die "push failed"
# the PR body is a file: macOS bash 3.2 cannot parse a quote inside a heredoc inside $(...)
BODY=$(mktemp); cat > "$BODY" <<EOF
Adds \`birds_z16\` and \`birds_z4\` to the model menu of all four patches (via \`tools/gen_patches.py\`), and \`train/\`: the CSAIL jobs that trained them.

- Data: Jon's Macaulay Library birdsong corpus, 940 recordings, 47.3 h, gated to 35.3 h (quiet runs over ~0.5 s removed; \`train/silence.py\`).
- Model: RAVE v2 (acids-rave 2.3), trained overnight on 3 L40S with DDP, batch 48, VAE phase to 170k steps, then GAN phase until the 07:25 export. Much shorter than the paper schedule; a class demo, not a reproduction.
- Export: streaming TorchScript for nn~, latent PCA kept, 16 and 4 dimensions (\`train/export_wrap.py --force_latent\`). In the z4 model the 12 dropped dimensions are filled with fresh noise each frame.
- The \`.ts\` files are gitignored and not on IRCAM's server; they play from the instructor's laptop.

Export job $JOB. Lab journal: thread \`rave-birds\`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
URL=$(gh pr create --base main --head birds-models \
  --title "Bird models in the patch menu (RAVE v2, Macaulay birdsong)" --body-file "$BODY") || die "gh pr create failed"
say "PR $URL"
gh pr merge birds-models --merge --delete-branch || die "merge failed ($URL)"
git checkout -q main && git pull -q --ff-only || die "pull after merge failed"
say "DONE: merged $URL; main is $(git rev-parse --short HEAD)"
osascript -e 'display notification "bird models exported, copied and merged" with title "rave-birds finish"' 2>/dev/null
