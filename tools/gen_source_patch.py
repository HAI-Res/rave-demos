"""Writes 'the-source/the source to noise.maxpat': THE SOURCE in vst~, one channel drives noise.
Same logic as the-source/source-noise.jsfx (REAPER). Run from the repo root."""
import json, os
GREY = [0.45, 0.45, 0.45, 1.0]
NAMES = ["Raw ECG","Cooked ECG","BPM","R2R","Valence","Arousal","RSP","RSP Rate","RSP Effort","Touch Plate","Unused","Unused"]
GEN = """Param depth(1, min=0, max=1);
Param smoothing(100, min=5, max=2000);
Param drives(2, min=0, max=2);
History mn(0);
History mx(0);
History started(0);
History c(0);
History lpl(0);
History lpr(0);
// the input is normalised to 0..1 by tracking its own range (forgets over ~10 s)
x = in1;
if (started == 0) { mn = x; mx = x; started = 1; }
rk = 1 - exp(-1 / (10 * samplerate));
if (x > mx) { mx = x; } else { mx = mx - (mx - x) * rk; }
if (x < mn) { mn = x; } else { mn = mn + (x - mn) * rk; }
r = mx - mn;
n = (r > 0.000001) ? (x - mn) / r : 0;
sk = 1 - exp(-1 / (smoothing * 0.001 * samplerate));
c = c + (n - c) * sk;
m = 1 - depth + depth * c;
level = (drives == 1) ? 1 : m;
bright = (drives == 0) ? 1 : m;
fc = 200 * pow(60, bright);
a = 1 - exp(-2 * pi * fc / samplerate);
lpl = lpl + (noise() - lpl) * a;
lpr = lpr + (noise() - lpr) * a;
out1 = lpl * level;
out2 = lpr * level;"""

class P:
    def __init__(s): s.boxes, s.lines = [], []
    def box(s, id, cls, rect, text=None, pres=None, **kw):
        b = {"id": id, "maxclass": cls, "patching_rect": rect}
        if text is not None: b["text"] = text
        if pres: b["presentation"] = 1; b["presentation_rect"] = pres
        b.update(kw); s.boxes.append({"box": b}); return id
    def obj(s, id, text, rect, ni, no, **kw): return s.box(id, "newobj", rect, text, numinlets=ni, numoutlets=no, outlettype=[""]*no, **kw)
    def msg(s, id, text, rect, **kw): return s.box(id, "message", rect, text, numinlets=2, numoutlets=1, outlettype=[""], **kw)
    def com(s, id, text, rect, **kw): return s.box(id, "comment", rect, text, numinlets=1, numoutlets=0, **kw)
    def wire(s, a, ao, b, bi): s.lines.append({"patchline": {"source": [a, ao], "destination": [b, bi]}})

def patcher(boxes, lines, rect, **kw):
    p = {"fileversion": 1, "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
         "classnamespace": "box", "rect": rect, "gridsize": [15.0, 15.0], "default_fontsize": 13.0,
         "boxes": boxes, "lines": lines}
    p.update(kw); return p

g = P()
g.box("in", "newobj", [20, 20, 30, 22], "in 1", numinlets=0, numoutlets=1, outlettype=[""])
g.box("code", "codebox", [20, 60, 560, 520], code=GEN, numinlets=1, numoutlets=2, outlettype=["", ""], fontface=0, fontsize=12.0)
g.box("o1", "newobj", [20, 600, 40, 22], "out 1", numinlets=1, numoutlets=0)
g.box("o2", "newobj", [120, 600, 40, 22], "out 2", numinlets=1, numoutlets=0)
g.wire("in",0,"code",0); g.wire("code",0,"o1",0); g.wire("code",1,"o2",0)
genp = patcher(g.boxes, g.lines, [100, 100, 620, 660], classnamespace="dsp.gen")

m = P(); L = 30
m.com("title", "THE SOURCE · noise", [30, 15, 400, 28], pres=[L, 20, 400, 28], fontsize=20.0)
m.box("open", "textbutton", [30, 60, 150, 26], pres=[L, 66, 150, 26], text="THE SOURCE window",
      numinlets=1, numoutlets=3, outlettype=["","",""], parameter_enable=0)
m.obj("to", "t b", [30, 90, 30, 22], 1, 1); m.msg("om", "open", [30, 115, 40, 22])
m.wire("open",0,"to",0); m.wire("to",0,"om",0)
m.obj("vst", 'vst~ 2 12 "THE SOURCE.vst3"', [30, 160, 700, 22], 2, 16)
m.wire("om",0,"vst",0)
m.com("sl", "signal", [30, 200, 60, 20], pres=[L, 112, 80, 20], textcolor=GREY)
m.box("sig", "umenu", [30, 220, 180, 24], pres=[L, 132, 180, 26], numinlets=1, numoutlets=3, outlettype=["int","",""],
      items=sum([[f"{i+1} {n}", ","] for i,n in enumerate(NAMES)], [])[:-1], parameter_enable=0, fontsize=14.0)
m.obj("p1", "+ 1", [30, 250, 40, 22], 2, 1)
m.obj("sel", "selector~ 12 2", [30, 280, 700, 22], 13, 1)
m.wire("sig",0,"p1",0); m.wire("p1",0,"sel",0)
for k in range(12): m.wire("vst", k, "sel", k+1)
m.com("dl", "drives", [230, 200, 60, 20], pres=[L+200, 112, 80, 20], textcolor=GREY)
m.box("drv", "umenu", [230, 220, 140, 24], pres=[L+200, 132, 140, 26], numinlets=1, numoutlets=3, outlettype=["int","",""],
      items=["loudness", ",", "brightness", ",", "both"], parameter_enable=0, fontsize=14.0)
m.msg("dm", "drives $1", [230, 250, 70, 22]); m.wire("drv",0,"dm",0)
m.box("gen", "newobj", [30, 320, 200, 22], "gen~", numinlets=1, numoutlets=2, outlettype=["signal","signal"], patcher=genp)
m.wire("sel",0,"gen",0); m.wire("dm",0,"gen",0)

def vslider(key, label, unit, lo, hi, cx, px, log, init_p, fmt_int):
    yy = 184
    m.com(key+"l", label, [px, 360, 90, 20], pres=[cx, yy, 90, 20], textcolor=GREY)
    m.box(key+"s", "slider", [px, 385, 22, 80], pres=[cx+4, yy+24, 22, 80], numinlets=1, numoutlets=1,
          outlettype=[""], floatoutput=1, size=1.0, parameter_enable=0)
    m.obj(key+"x", f"expr {lo}*pow({hi/lo},$f1)" if log else f"expr {lo}+({hi-lo})*$f1", [px, 470, 150, 22], 2, 1)
    out = key+"x"
    if fmt_int:
        m.obj(key+"r", "round 1", [px, 500, 60, 22], 2, 1); m.wire(key+"x",0,key+"r",0); out = key+"r"
    m.obj(key+"ps", "prepend set", [px+70, 500, 80, 22], 1, 1)
    m.box(key+"n", "number" if fmt_int else "flonum", [px, 530, 56, 24], pres=[cx, yy+110, 56, 24], numinlets=1, numoutlets=2,
          outlettype=["",""], ignoreclick=1, parameter_enable=0, fontsize=14.0, **({} if fmt_int else {"numdecimalplaces": 2}))
    m.com(key+"u", unit, [px+60, 530, 30, 20], pres=[cx+58, yy+112, 30, 20], textcolor=GREY)
    m.msg(key+"0", str(init_p), [px, 335, 35, 22])
    m.wire("lb",0,key+"0",0); m.wire(key+"0",0,key+"s",0); m.wire(key+"s",0,key+"x",0)
    m.wire(out,0,key+"ps",0); m.wire(key+"ps",0,key+"n",0)
    return out

m.obj("lb", "loadbang", [400, 15, 65, 22], 1, 1)
m.msg("sig0", "1", [480, 15, 30, 22]); m.msg("drv0", "2", [520, 15, 30, 22]); m.msg("v0", "100", [560, 15, 40, 22])
m.wire("lb",0,"sig0",0); m.wire("sig0",0,"sig",0); m.wire("lb",0,"drv0",0); m.wire("drv0",0,"drv",0)
d_out = vslider("dep", "depth", "", 0, 1, L, 400, False, 1.0, False)
s_out = vslider("smo", "smoothing", "ms", 5, 2000, L+130, 600, True, 0.6, True)
m.msg("depm", "depth $1", [400, 560, 70, 22]); m.msg("smom", "smoothing $1", [600, 560, 90, 22])
m.wire(d_out,0,"depm",0); m.wire("depm",0,"gen",0); m.wire(s_out,0,"smom",0); m.wire("smom",0,"gen",0)

m.box("vol", "gain~", [30, 600, 200, 26], pres=[L, 336, 220, 26], numinlets=2, numoutlets=2,
      outlettype=["signal",""], parameter_enable=0)
m.com("volc", "volume", [240, 603, 80, 20], pres=[L+228, 339, 80, 20], textcolor=GREY)
m.box("dac", "ezdac~", [30, 640, 45, 45], pres=[L+330, 326, 45, 45], numinlets=2, numoutlets=0)
m.com("dacc", "sound", [80, 655, 60, 20], pres=[L+278, 339, 50, 20], textcolor=GREY)
m.box("volr", "gain~", [250, 640, 200, 26], numinlets=2, numoutlets=2, outlettype=["signal",""], parameter_enable=0)
m.wire("v0",0,"vol",0); m.wire("v0",0,"volr",0); m.wire("vol",1,"volr",0)
m.wire("gen",0,"vol",0); m.wire("gen",1,"volr",0); m.wire("vol",0,"dac",0); m.wire("volr",0,"dac",1)
m.obj("tp", "thispatcher", [480, 60, 80, 22], 1, 2)
m.obj("dfl", "deferlow", [480, 90, 65, 22], 1, 1); m.msg("pres1", "presentation 1", [480, 115, 100, 22])
m.wire("lb",0,"dfl",0); m.wire("dfl",0,"pres1",0); m.wire("pres1",0,"tp",0)

root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
out = os.path.join(root, "the-source", "the source to noise.maxpat")
json.dump({"patcher": patcher(m.boxes, m.lines, [80, 60, 440, 400], openinpresentation=1)}, open(out, "w"), indent=1)
print("wrote", out)
