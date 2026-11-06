"""How much of the bird corpus is silence, and a gated copy without the long gaps.

Field recordings are never digitally silent: between calls there is room tone (wind,
insects, hiss). So "silence" is measured two ways per 2048-sample frame (one RAVE v2
latent frame at 44.1 kHz):
  absolute  frame RMS below -60 / -50 / -40 dBFS
  relative  frame RMS more than 30 dB under the file's loud level (95th percentile)

The gate keeps a frame if it is within GATE_DB of the file's loud level (and above
-60 dBFS), extended by HANG frames each side; quiet runs longer than MAX_GAP frames are
cut down to KEEP_GAP frames so the model still hears onsets out of near-silence.

usage: python -I silence.py CORPUS_DIR OUT_DIR [--gate-db 30] [--workers N]
"""
import argparse, json, os, subprocess, sys
from multiprocessing import Pool

import numpy as np
import soundfile as sf

SR, HOP = 44100, 2048
HANG, MAX_GAP, KEEP_GAP = 4, 11, 4      # frames: ~0.19 s, ~0.51 s, ~0.19 s


def decode(path):
    p = subprocess.run(["ffmpeg", "-hide_banner", "-loglevel", "error", "-i", path,
                        "-ac", "1", "-ar", str(SR), "-f", "f32le", "-"],
                       stdout=subprocess.PIPE, check=True)
    return np.frombuffer(p.stdout, dtype=np.float32)


def frame_db(x):
    n = len(x) // HOP
    f = x[:n * HOP].reshape(n, HOP)
    return 10 * np.log10(np.mean(f.astype(np.float64) ** 2, axis=1) + 1e-12)


def gate_mask(db, gate_db):
    loud = np.percentile(db, 95)
    keep = (db > loud - gate_db) & (db > -60)
    k = keep.copy()
    for s in range(1, HANG + 1):                      # hangover both sides
        k[s:] |= keep[:-s]; k[:-s] |= keep[s:]
    out = k.copy()                                    # shorten long quiet runs
    i = 0
    while i < len(k):
        if k[i]:
            i += 1; continue
        j = i
        while j < len(k) and not k[j]:
            j += 1
        if j - i > MAX_GAP:
            out[i:j] = False
            mid = (i + j) // 2
            out[mid - KEEP_GAP // 2: mid - KEEP_GAP // 2 + KEEP_GAP] = True
        else:
            out[i:j] = True
        i = j
    return out, loud


def one(args):
    path, out_dir, gate_db = args
    name = os.path.splitext(os.path.basename(path))[0]
    try:
        x = decode(path)
    except Exception as e:
        return {"file": name, "error": str(e)}
    db = frame_db(x)
    if len(db) == 0:
        return {"file": name, "error": "empty"}
    mask, loud = gate_mask(db, gate_db)
    n = len(db)
    y = x[:n * HOP].reshape(n, HOP)[mask].reshape(-1)
    if len(y):
        fade = min(64, len(y) // 2)                   # 1.5 ms ramps hide the splices' clicks
        y = y.copy()
        ramp = np.linspace(0, 1, fade, dtype=np.float32)
        for b in np.flatnonzero(np.diff(np.flatnonzero(mask)) > 1):
            e = (b + 1) * HOP
            y[max(e - fade, 0):e] *= ramp[::-1][:min(fade, e)]
            y[e:e + fade] *= ramp[:len(y[e:e + fade])]
        sf.write(os.path.join(out_dir, name + ".wav"), y, SR, subtype="PCM_16")
    return {"file": name, "seconds": len(x) / SR, "kept_seconds": len(y) / SR,
            "p10": float(np.percentile(db, 10)), "p50": float(np.percentile(db, 50)),
            "p95": float(loud),
            "below_60": float(np.mean(db < -60)), "below_50": float(np.mean(db < -50)),
            "below_40": float(np.mean(db < -40)),
            "rel30": float(np.mean(db < loud - 30))}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("corpus"); ap.add_argument("out")
    ap.add_argument("--gate-db", type=float, default=30)
    ap.add_argument("--workers", type=int, default=os.cpu_count())
    a = ap.parse_args()
    gated = os.path.join(a.out, "gated"); os.makedirs(gated, exist_ok=True)
    files = sorted(os.path.join(a.corpus, f) for f in os.listdir(a.corpus)
                   if f.lower().endswith((".mp3", ".wav", ".flac")) and not f.startswith("._"))
    rows = []
    with Pool(a.workers) as pool:
        for i, r in enumerate(pool.imap_unordered(one, [(f, gated, a.gate_db) for f in files])):
            rows.append(r)
            if i % 50 == 0:
                print(f"{i+1}/{len(files)}", flush=True)
                try:
                    subprocess.run(["scontrol", "update", f"JobId={os.environ['SLURM_JOB_ID']}",
                                    f"Comment=progress={100*(i+1)//len(files)}% silence {i+1}/{len(files)}"],
                                   timeout=10, capture_output=True)
                except Exception:
                    pass
    ok = [r for r in rows if "error" not in r]
    T = sum(r["seconds"] for r in ok)
    w = lambda k: sum(r[k] * r["seconds"] for r in ok) / T
    summary = {"files": len(files), "decoded": len(ok), "errors": [r for r in rows if "error" in r],
               "hours": T / 3600, "kept_hours": sum(r["kept_seconds"] for r in ok) / 3600,
               "gate_db": a.gate_db,
               "frac_below_-60dBFS": w("below_60"), "frac_below_-50dBFS": w("below_50"),
               "frac_below_-40dBFS": w("below_40"), "frac_30dB_under_file_p95": w("rel30"),
               "median_file_p50_dBFS": float(np.median([r["p50"] for r in ok])),
               "median_file_p95_dBFS": float(np.median([r["p95"] for r in ok]))}
    json.dump({"summary": summary, "files": rows}, open(os.path.join(a.out, "silence.json"), "w"), indent=1)
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
