"""Report job progress to the CSAIL cluster status page — opt-in, one line.

    from hai_res_progress import report
    for i, batch in enumerate(loader):
        ...
        report(i / len(loader), step=i, total=len(loader))

Progress rides in the SLURM job's Comment field, which the status page reads
from squeue. There is no token to obtain and no network egress from the compute
node: `scontrol` talks to slurmctld over the cluster's own network. SLURM
authenticates it for us — a user can only set the Comment on their own job
(anyone else gets "Invalid user id for job ...").

Design constraints, in order of importance:

1. NEVER raise. This runs inside other people's training loops. A status page
   must not be able to crash a 30-hour job.
2. NEVER block for long. Every call is subprocess with a hard timeout.
3. NEVER hammer slurmctld. It is the cluster's single contention point, so
   updates are throttled to once a minute regardless of how often you call.
4. Be a no-op off-cluster, so the same code runs on a laptop unchanged.
"""
from __future__ import annotations

import os
import re
import shutil
import subprocess
import time

__all__ = ["report", "track", "walltime_fraction", "walltime_remaining",
           "shrink_time_limit"]

MIN_INTERVAL = float(os.environ.get("HAI_RES_PROGRESS_INTERVAL", "60"))
_last_sent = 0.0
_last_payload = None


def _job_id():
    """The array task's own id when in an array, else the plain job id."""
    jid = os.environ.get("SLURM_JOB_ID") or os.environ.get("SLURM_JOBID")
    arr = os.environ.get("SLURM_ARRAY_JOB_ID")
    task = os.environ.get("SLURM_ARRAY_TASK_ID")
    if arr and task:
        return f"{arr}_{task}"
    return jid


def _fmt_eta(seconds):
    if seconds is None or seconds < 0:
        return None
    seconds = int(seconds)
    d, rem = divmod(seconds, 86400)
    h, rem = divmod(rem, 3600)
    m, sec = divmod(rem, 60)
    if d:
        return f"{d}d{h:02d}h"
    if h:
        return f"{h}h{m:02d}m"
    if m:
        return f"{m}m"
    return f"{sec}s"          # "0m" is useless; sub-minute deserves seconds


_window = ...          # (start_epoch, end_epoch) | None; Ellipsis = not looked up yet


def _walltime_window():
    """(start, end) epoch seconds for this job, or None. One subprocess, cached.

    Idea contributed by the ontour-neural-bot-ed session: a walltime-capped,
    resume-designed run has no meaningful step denominator. It will never reach
    --updates, so step/target pegs the bar low forever and reads as a stalled
    job. Its honest completion measure is elapsed/limit.
    """
    global _window
    if _window is not Ellipsis:
        return _window
    _window = None
    try:
        jid = _job_id()
        if not jid or not shutil.which("scontrol"):
            return None
        out = subprocess.run(["scontrol", "show", "job", str(jid), "--oneliner"],
                             capture_output=True, text=True, timeout=10)
        if out.returncode != 0:
            return None
        fields = dict(re.findall(r"(\w+)=(\S+)", out.stdout))
        fmt = "%Y-%m-%dT%H:%M:%S"
        start = time.mktime(time.strptime(fields["StartTime"], fmt))
        end = time.mktime(time.strptime(fields["EndTime"], fmt))
        if end > start:
            _window = (start, end)
    except Exception:                                     # noqa: BLE001
        _window = None                                    # unknown, not fatal
    return _window


def walltime_fraction():
    """How far through its time limit this job is, 0..1, or None if unknown."""
    try:
        w = _walltime_window()
        if not w:
            return None
        start, end = w
        return max(0.0, min(1.0, (time.time() - start) / (end - start)))
    except Exception:                                     # noqa: BLE001
        return None


def walltime_remaining():
    """Seconds left before SLURM kills this job, or None if unknown."""
    try:
        w = _walltime_window()
        if not w:
            return None
        return max(0.0, w[1] - time.time())
    except Exception:                                     # noqa: BLE001
        return None


def report(fraction=None, *, step=None, total=None, msg=None, eta_seconds=None,
           force=False):
    """Publish progress. Returns True if it actually wrote, False if throttled,
    skipped (not under SLURM) or failed. Never raises."""
    global _last_sent, _last_payload
    try:
        jid = _job_id()
        if not jid or not shutil.which("scontrol"):
            return False                                  # not on the cluster

        bits = []
        if fraction is not None:
            # truncate, never round: 199/200 must not display as 100%
            pct = max(0.0, min(1.0, float(fraction))) * 100
            bits.append(f"progress={int(pct) if pct < 100 else 100}%")
        if step is not None and total:
            bits.append(f"step={step}/{total}")
        elif step is not None:
            bits.append(f"step={step}")
        e = _fmt_eta(eta_seconds)
        if e:
            bits.append(f"eta={e}")
        if msg:
            bits.append(str(msg).replace("\n", " ")[:40])
        payload = " ".join(bits)[:200]                    # Comment is not unbounded
        if not payload:
            return False

        now = time.monotonic()
        if not force and payload == _last_payload:
            return False                                  # nothing changed
        if not force and (now - _last_sent) < MIN_INTERVAL:
            return False                                  # protect slurmctld

        proc = subprocess.run(["scontrol", "update", f"jobid={jid}", f"Comment={payload}"],
                              stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                              timeout=10, check=False)
        if proc.returncode != 0:
            # e.g. someone else's job ("Invalid user id"), or the job just ended.
            # Still record the attempt time so a persistent failure cannot turn
            # into a per-step retry storm against slurmctld.
            _last_sent = now
            return False
        _last_sent, _last_payload = now, payload
        return True
    except Exception:                                     # noqa: BLE001
        return False                                      # a status page never breaks a job


def shrink_time_limit(remaining_seconds, *, margin=1.5, minimum_minutes=10):
    """Reduce this job's walltime to what it actually still needs.

    Users may only DECREASE a time limit, so this is safe to expose and cannot
    be used to grab more time. Shrinking an over-estimated limit is the single
    most useful thing a job can do for everyone else: SLURM's backfill packs
    short jobs into gaps ahead of big reservations, and it can only do that with
    limits it believes. Published measurements put ML runtime prediction at
    33-64% of jobs killed by the wallclock, versus 78-99% success for
    user-supplied estimates - a job reporting its OWN remaining time avoids that
    trade entirely, because it is measuring rather than predicting.

    `margin` multiplies the estimate; never shrink to less than you need.
    Returns True if a change was requested. Never raises.
    """
    try:
        jid = _job_id()
        if not jid or not shutil.which("scontrol") or remaining_seconds is None:
            return False
        minutes = max(int((remaining_seconds * margin) / 60) + 1, int(minimum_minutes))
        proc = subprocess.run(["scontrol", "update", f"jobid={jid}", f"TimeLimit={minutes}"],
                              stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                              timeout=10, check=False)
        return proc.returncode == 0
    except Exception:                                     # noqa: BLE001
        return False


def track(iterable, *, total=None, msg=None, every=1):
    """Wrap any iterable and report progress as it is consumed — the tqdm shape.

        for batch in track(loader):
            ...

    This is the answer to "does every job need custom progress code?": for a
    loop with a known length, no. `total` is taken from len() when available.
    When the length is unknown (a generator, a stream, "train until converged")
    it still reports step count and elapsed time, just without a percentage —
    the dashboard renders that as text rather than a bar.

    Anything that is not a loop — a multi-phase pipeline, an inner solver —
    calls report() directly. That part is irreducibly job-specific.

    Never raises: iteration continues even if reporting fails entirely.
    """
    if total is None:
        try:
            total = len(iterable)
        except (TypeError, AttributeError):
            total = None
    started = time.monotonic()
    i = 0
    for item in iterable:
        yield item
        i += 1
        if every > 1 and i % every:
            continue
        try:
            elapsed = time.monotonic() - started
            if total:
                frac = i / total
                # linear extrapolation from observed rate; honest for steady loops,
                # and the throttle means a wrong early estimate is short-lived
                eta = (elapsed / i) * (total - i) if i else None
                report(frac, step=i, total=total, msg=msg, eta_seconds=eta)
            else:
                report(None, step=i, msg=msg)
        except Exception:                                 # noqa: BLE001
            pass
