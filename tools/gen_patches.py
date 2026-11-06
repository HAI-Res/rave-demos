"""Writes '1. decoder by hand.maxpat' and '2. random walk.maxpat'.

The patches are generated so their layout stays exact; edit this file, run
  python3 tools/gen_patches.py
from the repo root, and restart Max (it caches abstractions and open patches).
"""
import json, os
MAXD = 16
GREY = [0.45, 0.45, 0.45, 1.0]
TINYSOL = "https://zenodo.org/records/3685331"
models = [("sol_ordinario",4,2048,"orchestral instruments, ordinary playing (IRCAM SOL)", TINYSOL),
          ("sol_ordinario_fast",8,512,"the same sounds, a smaller faster model", TINYSOL),
          ("sol_full",8,2048,"orchestral instruments, every playing technique (IRCAM SOL)", TINYSOL),
          ("isis",8,2048,"three singers recorded for IRCAM's ISiS synthesizer", "https://isis-documentation.readthedocs.io/en/latest/voice_installation.html"),
          ("VCTK",8,2048,"speech, 110 English speakers reading aloud", "https://huggingface.co/datasets/CSTR-Edinburgh/vctk"),
          ("nasa",8,2048,"radio from the Apollo 11 mission", "https://www.youtube.com/watch?v=DejhGSEu8wk"),
          ("percussion",4,2048,"8 hours of percussion (never published)", None),
          ("musicnet",16,2048,"330 classical recordings (MusicNet)", "https://zenodo.org/records/5120004"),
          ("vintage",16,2048,"80 hours of vintage music (never published)", None)]

def patcher(boxes, lines, rect, **kw):
    p = {"fileversion": 1, "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
         "classnamespace": "box", "rect": rect, "gridsize": [15.0, 15.0], "default_fontsize": 13.0,
         "boxes": boxes, "lines": lines}
    p.update(kw); return p

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
    def sub(s, rect): return patcher(s.boxes, s.lines, rect)

def tbutton(m, id, label, rect, pres, **kw):
    return m.box(id, "textbutton", rect, pres=pres, text=label, numinlets=1, numoutlets=3,
                 outlettype=["","",""], parameter_enable=0, **kw)

def build(walk):
    NS = "rave2" if walk else "rave1"
    L = 30
    Y = dict(menu=112, info=148, what=168, bars=200, barsc=430, btn=476)
    if walk:
        Y.update(meta=522, metac=546, mrow=574, paint=606, nn=650, nnc=680, vol=722, h=790)
    else:
        Y.update(nn=520, nnc=550, vol=592, h=660)

    # [p smooth]: list in, one line~ per dimension out. Glide time from NS.glide (default 30 ms).
    sm = P()
    sm.box("in", "inlet", [20, 20, 30, 22], numinlets=0, numoutlets=1, outlettype=[""])
    sm.obj("up", "unpack " + " ".join(["f"]*MAXD), [20, 60, 60*MAXD, 22], 1, MAXD)
    sm.obj("rg", f"r {NS}.glide", [20, 100, 90, 22], 0, 1)
    sm.wire("in",0,"up",0)
    for i in range(MAXD):
        x = 20 + i*60
        sm.obj(f"m{i}", "pack f 30", [x, 140, 55, 22], 2, 1); sm.obj(f"l{i}", "line~", [x, 175, 45, 22], 2, 2)
        sm.box(f"o{i}", "outlet", [x, 215, 30, 22], numinlets=1, numoutlets=0)
        sm.wire("up",i,f"m{i}",0); sm.wire("rg",0,f"m{i}",1); sm.wire(f"m{i}",0,f"l{i}",0); sm.wire(f"l{i}",0,f"o{i}",0)
    sm.com("c", "Glides between values so the decoder never hears a jump. The glide time follows the walk's step interval.",
           [20, 255, 700, 20])

    # [p model]
    md = P()
    md.box("in", "inlet", [20, 20, 30, 22], numinlets=0, numoutlets=1, outlettype=[""])
    md.obj("rt", "route " + " ".join(str(i) for i in range(len(models))), [20, 60, 60*len(models), 22], 1, len(models)+1)
    md.box("out", "outlet", [20, 420, 30, 22], numinlets=1, numoutlets=0)
    md.wire("in",0,"rt",0)
    for i,(name,d,hop,desc,url) in enumerate(models):
        x = 20 + i*60
        script = (f"script delete rave, script newdefault rave 40 700 nn~ {name} decode, "
                  + ", ".join(f"script connect smooth {k} rave {k}" for k in range(d))
                  + ", script connect rave 0 vol 0, script sendbox rave presentation 1, "
                  f"script sendbox rave presentation_rect {L} {Y['nn']} 560 26")
        zeros = " ".join(["0"]*d)
        ui = (f"; {NS}.n {d}; {NS}.bars size {d}; {NS}.bars {zeros}; "
              f"{NS}.info set {d} dimensions · one new frame every {hop} samples; "
              f"{NS}.what set trained on {desc.replace(',', ' ·')}; {NS}.url symbol {url or '-'}")
        md.obj(f"t{i}", "t b b", [x, 100, 40, 22], 1, 2)
        md.msg(f"s{i}", script, [x, 140, 55, 22]); md.msg(f"u{i}", ui, [x, 180, 55, 22])
        md.wire("rt",i,f"t{i}",0); md.wire(f"t{i}",1,f"s{i}",0); md.wire(f"t{i}",0,f"u{i}",0); md.wire(f"s{i}",0,"out",0)
    md.com("c", "nn~ cannot swap models while running, so choosing one deletes the nn~ box and scripts a new one, "
           "wired to exactly as many dimensions as that model has.", [20, 470, 520, 40])

    # [p random]
    rd = P()
    rd.box("in", "inlet", [20, 20, 30, 22], numinlets=0, numoutlets=1, outlettype=["bang"])
    rd.obj("un", f"uzi {MAXD}", [20, 55, 60, 22], 2, 3)
    rd.obj("tr", "t b b b", [20, 90, 60, 22], 1, 3)
    for k,x in enumerate([20,110,200]): rd.obj(f"r{k}", "random 1001", [x, 125, 80, 22], 2, 1)
    rd.obj("ex", "expr ($i1+$i2+$i3-1500)/250.", [20, 165, 200, 22], 3, 1)
    rd.obj("tl", f"zl group {MAXD}", [20, 200, 90, 22], 2, 2)
    rd.box("out", "outlet", [20, 240, 30, 22], numinlets=1, numoutlets=0)
    rd.wire("in",0,"un",0); rd.wire("un",0,"tr",0)
    rd.wire("tr",2,"r2",0); rd.wire("tr",1,"r1",0); rd.wire("tr",0,"r0",0)
    rd.wire("r2",0,"ex",2); rd.wire("r1",0,"ex",1); rd.wire("r0",0,"ex",0)
    rd.wire("ex",0,"tl",0); rd.wire("tl",0,"out",0)

    m = P()
    title = "RAVE 2 · a random walk" if walk else "RAVE 1 · the decoder, by hand"
    sub = ("Choose a model, switch the sound on, start the walk." if walk
           else "Choose a model, switch the sound on, drag the bars.")
    m.com("title", title, [30, 15, 500, 28], pres=[L, 20, 560, 28], fontsize=20.0)
    m.com("sub", sub, [30, 45, 500, 20], pres=[L, 52, 560, 20], textcolor=GREY)
    m.com("mlab", "model", [30, 80, 80, 20], pres=[L, 92, 80, 20], textcolor=GREY)
    m.box("menu", "umenu", [30, 100, 200, 24], pres=[L, Y["menu"], 210, 26], numinlets=1, numoutlets=3, outlettype=["int","",""],
          items=sum([[n, ","] for n,*_ in models], [])[:-1], parameter_enable=0, fontsize=14.0)
    m.obj("info", f"r {NS}.info", [430, 140, 90, 22], 0, 1); m.obj("what", f"r {NS}.what", [530, 140, 90, 22], 0, 1)
    m.com("infoc", "4 dimensions", [250, 170, 380, 20], pres=[L, Y["info"], 560, 20])
    m.com("whatc", "", [250, 190, 380, 20], pres=[L, Y["what"], 560, 20], textcolor=GREY)
    m.wire("info",0,"infoc",0); m.wire("what",0,"whatc",0)
    m.obj("mdl", "p model", [250, 100, 70, 22], 1, 1, patcher=md.sub([100,100,700,540]))
    m.obj("tp", "thispatcher", [330, 100, 80, 22], 1, 2)
    m.wire("menu",0,"mdl",0); m.wire("mdl",0,"tp",0)
    m.obj("lb", "loadbang", [640, 15, 65, 22], 1, 1); m.msg("m0", "0", [640, 45, 30, 22]); m.msg("v0", "100", [680, 45, 40, 22])
    m.wire("lb",0,"m0",0); m.wire("m0",0,"menu",0); m.wire("lb",0,"v0",0)

    tbutton(m, "data", "training data ↗", [800, 100, 150, 26], [L+225, Y["menu"], 150, 26])
    m.obj("td", "t b", [800, 130, 30, 22], 1, 1); m.obj("ru", f"r {NS}.url", [860, 130, 80, 22], 0, 1)
    m.obj("ureg", "zl reg", [800, 160, 60, 22], 2, 2); m.obj("usel", "sel -", [800, 190, 50, 22], 2, 2)
    m.msg("ulaunch", "; max launchbrowser $1", [800, 220, 160, 22])
    m.wire("data",0,"td",0); m.wire("td",0,"ureg",0); m.wire("ru",0,"ureg",1)
    m.wire("ureg",0,"usel",0); m.wire("usel",1,"ulaunch",0)

    m.obj("bars_r", f"r {NS}.bars", [30, 250, 90, 22], 0, 1)
    m.box("bars", "multislider", [30, 280, 560, 200], pres=[L, Y["bars"], 560, 220], numinlets=1, numoutlets=2, outlettype=["",""],
          size=4, setminmax=[-3.0, 3.0], setstyle=1, signed=1, parameter_enable=0,
          slidercolor=[0.30,0.55,0.75,1.0], drawpeaks=0, spacing=6, thickness=2)
    m.wire("bars_r",0,"bars",0)
    cap = ("Each bar is one number the decoder reads. The middle line is 0, the typical sound; "
           "top and bottom are ±3, the edge of what it learned. Bars on the left matter most.")
    if walk: cap = cap.replace("Bars on the left matter most.", "Drag them to move the walk.")
    m.com("barsc", cap, [30, 485, 560, 40], pres=[L, Y["barsc"], 560, 40], textcolor=GREY)

    tbutton(m, "zero", "zero", [600, 280, 70, 24], [L, Y["btn"], 70, 24])
    tbutton(m, "rnd", "random", [600, 310, 70, 24], [L+80, Y["btn"], 80, 24])
    m.msg("zl", " ".join(["0"]*MAXD), [680, 280, 140, 22])
    m.obj("rp", "p random", [680, 310, 70, 22], 1, 1, patcher=rd.sub([120,120,500,300]))
    m.obj("tz", "t b", [600, 340, 30, 22], 1, 1); m.obj("trn", "t b", [640, 340, 30, 22], 1, 1)
    m.obj("cut", "zl slice 4", [680, 370, 80, 22], 2, 2); m.obj("rn", f"r {NS}.n", [770, 340, 70, 22], 0, 1)
    m.wire("zero",0,"tz",0); m.wire("tz",0,"zl",0); m.wire("rnd",0,"trn",0); m.wire("trn",0,"rp",0)
    m.wire("zl",0,"cut",0); m.wire("rp",0,"cut",0); m.wire("rn",0,"cut",1)

    m.obj("smooth", "p smooth", [30, 640, 560, 22], 1, MAXD, varname="smooth", patcher=sm.sub([140,140,1020,300]))

    if not walk:
        m.wire("cut",0,"bars",0)
        m.wire("bars",0,"smooth",0)
    else:
        # Every position, from any source, goes through one hub: to the decoder at full rate,
        # to the walk so it continues from there, and to the bars no faster than 4 times a second.
        m.obj("hub", "t l l l", [30, 560, 560, 22], 1, 3)
        m.obj("walk", "js walk.js", [400, 520, 80, 22], 1, 1)
        # paint clock: store the latest position; every 250 ms, repaint only if it changed
        m.obj("paint", "zl reg", [600, 590, 60, 22], 2, 2)
        m.obj("clock", "qmetro 250", [600, 560, 80, 22], 2, 1)
        m.msg("clock1", "1", [690, 530, 30, 22])
        m.obj("chg", "zl change", [600, 620, 80, 22], 2, 2)
        m.obj("pset", "prepend setlist", [600, 650, 100, 22], 1, 1)  # multislider: set = one slider; setlist = all
        m.wire("lb",0,"clock1",0); m.wire("clock1",0,"clock",0); m.wire("clock",0,"paint",0)
        m.wire("cut",0,"bars",0)          # zero / random land on the bars, which output into the hub
        m.wire("bars",0,"hub",0); m.wire("walk",0,"hub",0)
        m.wire("hub",2,"smooth",0); m.wire("hub",1,"walk",0); m.wire("hub",0,"paint",1)
        m.wire("paint",0,"chg",0); m.wire("chg",0,"pset",0); m.wire("pset",0,"bars",0)

        m.com("metah", "“metaparameters”", [700, 400, 200, 22], pres=[L, Y["meta"], 300, 22], fontsize=15.0)
        m.com("metac", "They shape the walk, not the model: how far each step goes, and how often it steps.",
              [700, 425, 560, 20], pres=[L, Y["metac"], 560, 20], textcolor=GREY)
        m.box("go", "toggle", [700, 450, 26, 26], pres=[L, Y["mrow"], 26, 26], numinlets=1, numoutlets=1,
              outlettype=["int"], parameter_enable=0)
        m.com("gol", "walk", [730, 452, 50, 20], pres=[L+32, Y["mrow"]+3, 50, 20])
        m.com("ssl", "step size", [820, 450, 70, 20], pres=[L+118, Y["mrow"]+3, 70, 20], textcolor=GREY)
        m.box("ss", "flonum", [890, 450, 60, 22], pres=[L+188, Y["mrow"], 64, 26], numinlets=1, numoutlets=2,
              outlettype=["",""], minimum=0.0, maximum=1.0, numdecimalplaces=2, parameter_enable=0, fontsize=14.0)
        m.com("sev", "step every", [960, 450, 80, 20], pres=[L+275, Y["mrow"]+3, 80, 20], textcolor=GREY)
        m.box("ms", "number", [1040, 450, 60, 22], pres=[L+352, Y["mrow"], 64, 26], numinlets=1, numoutlets=2,
              outlettype=["",""], minimum=20, maximum=4000, parameter_enable=0, fontsize=14.0)
        m.com("msu", "ms", [1105, 450, 30, 20], pres=[L+420, Y["mrow"]+3, 30, 20], textcolor=GREY)
        m.com("paintc", "The bars repaint at most 4 times a second. The decoder hears every step.",
              [700, 480, 560, 20], pres=[L, Y["paint"], 560, 20], textcolor=GREY)
        m.msg("ss0", "0.15", [700, 15, 40, 22]); m.msg("ms0", "200", [750, 15, 40, 22])
        m.wire("lb",0,"ss0",0); m.wire("lb",0,"ms0",0); m.wire("ss0",0,"ss",0); m.wire("ms0",0,"ms",0)
        m.obj("pss", "prepend stepsize", [890, 480, 110, 22], 1, 1)
        m.wire("ss",0,"pss",0); m.wire("pss",0,"walk",0)
        m.obj("met", "metro 200", [700, 510, 80, 22], 2, 1)
        m.obj("sg", f"s {NS}.glide", [1040, 510, 90, 22], 1, 0)
        m.wire("go",0,"met",0); m.wire("ms",0,"met",1); m.wire("ms",0,"sg",0); m.wire("met",0,"walk",0)

    m.obj("rave", "nn~ sol_ordinario decode", [40, 700, 300, 22], 4, 1, varname="rave", pres=[L, Y["nn"], 560, 26], fontsize=14.0)
    for k in range(4): m.wire("smooth",k,"rave",k)
    m.com("ravec", "the decoder: these numbers in, sound out", [350, 700, 300, 20], pres=[L, Y["nnc"], 560, 20], textcolor=GREY)
    m.box("vol", "gain~", [40, 740, 200, 26], pres=[L, Y["vol"], 220, 26], varname="vol", numinlets=2, numoutlets=2,
          outlettype=["signal",""], parameter_enable=0)
    m.wire("v0",0,"vol",0)
    m.com("volc", "volume", [250, 745, 80, 20], pres=[L+228, Y["vol"]+3, 80, 20], textcolor=GREY)
    m.box("dac", "ezdac~", [40, 785, 45, 45], pres=[L+515, Y["vol"]-10, 45, 45], numinlets=2, numoutlets=0)
    m.com("dacc", "sound", [95, 800, 60, 20], pres=[L+462, Y["vol"]+3, 50, 20], textcolor=GREY)
    m.wire("rave",0,"vol",0); m.wire("vol",0,"dac",0); m.wire("vol",0,"dac",1)
    return {"patcher": patcher(m.boxes, m.lines, [80, 60, 640, Y["h"]], openinpresentation=1)}

root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for walk, name in [(False, "1. decoder by hand.maxpat"), (True, "2. random walk.maxpat")]:
    json.dump(build(walk), open(os.path.join(root, name), "w"), indent=1)
    print("wrote", name)
