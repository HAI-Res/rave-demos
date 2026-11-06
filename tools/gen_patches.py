"""Writes '1. decoder by hand', '2. capture and return' and '3. random walk' (.maxpat).

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

def build(kind):
    walk, cap, phone = kind == "walk", kind == "capture", kind == "phone"
    NS = {"hand": "rave1", "capture": "rave2", "walk": "rave3", "phone": "rave4"}[kind]
    L = 30
    Y = dict(mlab=58, menu=78, info=110, bars=138, btn=370)
    if walk:
        Y.update(meta=414, mrow=444, nn=600, vol=644, h=714)
    else:
        Y.update(nn=412, vol=456, h=526)
    if cap:
        Y.update(slots=424, nn=560, vol=604, h=674)
    if phone:
        Y.update(motion=364, meta=416, mrow=446, nn=602, vol=646, h=712)

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
              f"{NS}.info set {d} dimensions; "
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
    title = {"hand": "RAVE 1 · the decoder, by hand", "capture": "RAVE 2 · capture and return",
             "walk": "RAVE 3 · a random walk", "phone": "RAVE 4 · the phone"}[kind]
    sub = ("Choose a model, switch the sound on, start the walk." if walk
           else "Choose a model, switch the sound on, drag the bars.")
    m.com("title", title, [30, 15, 500, 28], pres=[L, 20, 560, 28], fontsize=20.0)
    m.com("mlab", "model", [30, 80, 80, 20], pres=[L, Y["mlab"], 80, 20], textcolor=GREY)
    m.box("menu", "umenu", [30, 100, 200, 24], pres=[L, Y["menu"], 210, 26], numinlets=1, numoutlets=3, outlettype=["int","",""],
          items=sum([[n, ","] for n,*_ in models], [])[:-1], parameter_enable=0, fontsize=14.0)
    m.obj("info", f"r {NS}.info", [430, 140, 90, 22], 0, 1); m.obj("what", f"r {NS}.what", [530, 140, 90, 22], 0, 1)
    m.com("infoc", "4 dimensions", [250, 170, 380, 20], pres=[L, Y["info"], 560, 20], textcolor=GREY)
    m.wire("info",0,"infoc",0)
    m.obj("mdl", "p model", [250, 100, 70, 22], 1, 1, patcher=md.sub([100,100,700,540]))
    m.obj("tp", "thispatcher", [330, 100, 80, 22], 1, 2)
    m.wire("menu",0,"mdl",0); m.wire("mdl",0,"tp",0)
    m.obj("lb", "loadbang", [640, 15, 65, 22], 1, 1); m.msg("m0", "0", [640, 45, 30, 22]); m.msg("v0", "100", [680, 45, 40, 22])
    m.wire("lb",0,"m0",0); m.wire("m0",0,"menu",0); m.wire("lb",0,"v0",0)
    # the file already says openinpresentation; this makes sure, once the window exists
    m.obj("dl", "deferlow", [560, 15, 65, 22], 1, 1); m.msg("pres1", "presentation 1", [560, 45, 100, 22])
    m.wire("lb",0,"dl",0); m.wire("dl",0,"pres1",0); m.wire("pres1",0,"tp",0)

    tbutton(m, "data", "training data ↗", [800, 100, 150, 26], [L+225, Y["menu"], 150, 26])
    m.obj("td", "t b", [800, 130, 30, 22], 1, 1); m.obj("ru", f"r {NS}.url", [860, 130, 80, 22], 0, 1)
    m.obj("ureg", "zl reg", [800, 160, 60, 22], 2, 2); m.obj("usel", "sel -", [800, 190, 50, 22], 2, 2)
    m.msg("ulaunch", "; max launchbrowser $1", [800, 220, 160, 22])
    m.wire("data",0,"td",0); m.wire("td",0,"ureg",0); m.wire("ru",0,"ureg",1)
    m.wire("ureg",0,"usel",0); m.wire("usel",1,"ulaunch",0)

    m.obj("bars_r", f"r {NS}.bars", [30, 250, 90, 22], 0, 1)
    m.box("bars", "multislider", [30, 280, 560, 200], pres=[L, Y["bars"], 560, 220], numinlets=1, numoutlets=2, outlettype=["",""],
          size=4, setminmax=[-3.0, 3.0], setstyle=1, signed=1, parameter_enable=0,
          slidercolor=[0.30,0.55,0.75,1.0], drawpeaks=0, spacing=6, thickness=2,
          **({"ignoreclick": 1} if phone else {}))
    m.wire("bars_r",0,"bars",0)

    if not phone:
        tbutton(m, "zero", "zero", [600, 280, 70, 24], [L, Y["btn"], 70, 24])
        tbutton(m, "rnd", "random", [600, 310, 70, 24], [L+80, Y["btn"], 80, 24])
        m.msg("zl", " ".join(["0"]*MAXD), [680, 280, 140, 22])
        m.obj("rp", "p random", [680, 310, 70, 22], 1, 1, patcher=rd.sub([120,120,500,300]))
        m.obj("tz", "t b", [600, 340, 30, 22], 1, 1); m.obj("trn", "t b", [640, 340, 30, 22], 1, 1)
        m.obj("cut", "zl slice 4", [680, 370, 80, 22], 2, 2); m.obj("rn", f"r {NS}.n", [770, 340, 70, 22], 0, 1)
        m.wire("zero",0,"tz",0); m.wire("tz",0,"zl",0); m.wire("rnd",0,"trn",0); m.wire("trn",0,"rp",0)
        m.wire("zl",0,"cut",0); m.wire("rp",0,"cut",0); m.wire("rn",0,"cut",1)

    m.obj("smooth", "p smooth", [30, 640, 560, 22], 1, MAXD, varname="smooth", patcher=sm.sub([140,140,1020,300]))

    # Two log sliders: equal movements multiply the value by the same factor (Weber), so
    # "twice as fast" or "twice as far" is the same distance anywhere on the slider.
    def logslider(key, label, unit, lo, hi, cx, px, fmt_int):
        yy = Y["mrow"]  # column: label, short vertical slider, readout
        m.com(key+"l", label, [px, 450, 80, 20], pres=[cx, yy, 90, 20], textcolor=GREY)
        m.box(key+"s", "slider", [px, 475, 22, 80], pres=[cx+4, yy+24, 22, 80], numinlets=1, numoutlets=1,
              outlettype=[""], floatoutput=1, size=1.0, parameter_enable=0)
        m.obj(key+"x", f"expr {lo}*pow({hi/lo},$f1)", [px, 505, 160, 22], 2, 1)
        out = key+"x"
        if fmt_int:
            m.obj(key+"r", "round 1", [px, 535, 60, 22], 2, 1); m.wire(key+"x",0,key+"r",0); out = key+"r"
        m.obj(key+"ps", "prepend set", [px+70, 535, 80, 22], 1, 1)
        m.box(key+"n", "number" if fmt_int else "flonum", [px, 565, 60, 22], pres=[cx, yy+110, 56, 24],
              numinlets=1, numoutlets=2, outlettype=["",""], ignoreclick=1, parameter_enable=0, fontsize=14.0,
              **({} if fmt_int else {"numdecimalplaces": 2}))
        m.com(key+"u", unit, [px+65, 565, 30, 20], pres=[cx+58, yy+112, 30, 20], textcolor=GREY)
        m.msg(key+"0", "0.5", [px, 420, 35, 22])
        m.wire("lb",0,key+"0",0); m.wire(key+"0",0,key+"s",0)
        m.wire(key+"s",0,key+"x",0); m.wire(out,0,key+"ps",0); m.wire(key+"ps",0,key+"n",0)
        return out

    if not walk and not phone:
        m.wire("cut",0,"bars",0)
        m.wire("bars",0,"smooth",0)
    if cap:
        sy = Y["slots"]
        m.obj("slots", "js slots.js", [700, 420, 80, 22], 1, 3)
        m.wire("bars",0,"slots",0)
        m.box("capt", "toggle", [700, 380, 26, 26], pres=[L, sy, 26, 26], numinlets=1, numoutlets=1,
              outlettype=["int"], parameter_enable=0)
        m.com("captl", "capture", [730, 382, 60, 20], pres=[L+32, sy+3, 70, 20])
        m.obj("pcap", "prepend capture", [700, 450, 110, 22], 1, 1)
        m.wire("capt",0,"pcap",0); m.wire("pcap",0,"slots",0); m.wire("slots",2,"capt",0)
        m.wire("slots",0,"bars",0)
        m.obj("srt", "route 1 2 3 4 5 6", [820, 450, 130, 22], 1, 7)
        m.wire("slots",1,"srt",0)
        for k in range(6):
            n = k + 1
            tbutton(m, f"slot{n}", str(n), [820+k*50, 380, 44, 26], [L+120+k*48, sy, 42, 26])
            m.obj(f"st{n}", "t b", [820+k*50, 410, 30, 22], 1, 1)
            m.msg(f"sn{n}", str(n), [820+k*50, 420+30, 30, 22])
            m.wire(f"slot{n}",0,f"st{n}",0); m.wire(f"st{n}",0,f"sn{n}",0); m.wire(f"sn{n}",0,"slots",0)
            m.wire("srt",k,f"slot{n}",0)
        m.obj("rnc", f"r {NS}.n", [960, 420, 70, 22], 0, 1); m.msg("clr", "clear", [960, 450, 45, 22])
        m.wire("rnc",0,"clr",0); m.wire("clr",0,"slots",0)
        # glide: how long the sound takes to travel to the returned values (log, 30-3000 ms)
        gx = L + 440
        m.com("gll", "glide", [1100, 380, 60, 20], pres=[gx, sy-24, 60, 20], textcolor=GREY)
        m.box("gls", "slider", [1100, 405, 22, 80], pres=[gx+4, sy, 22, 80], numinlets=1, numoutlets=1,
              outlettype=[""], floatoutput=1, size=1.0, parameter_enable=0)
        m.obj("glx", "expr 30*pow(100.,$f1)", [1100, 490, 140, 22], 2, 1)
        m.obj("glr", "round 1", [1100, 520, 60, 22], 2, 1)
        m.obj("glp", "prepend set", [1170, 520, 80, 22], 1, 1)
        m.box("gln", "number", [1100, 550, 56, 24], pres=[gx, sy+86, 56, 24], numinlets=1, numoutlets=2,
              outlettype=["",""], ignoreclick=1, parameter_enable=0, fontsize=14.0)
        m.com("glu", "ms", [1160, 550, 30, 20], pres=[gx+58, sy+88, 30, 20], textcolor=GREY)
        m.obj("gsend", f"s {NS}.glide", [1170, 580, 90, 22], 1, 0)
        m.msg("gl0", "0.5", [1100, 350, 35, 22])
        m.wire("lb",0,"gl0",0); m.wire("gl0",0,"gls",0); m.wire("gls",0,"glx",0); m.wire("glx",0,"glr",0)
        m.wire("glr",0,"glp",0); m.wire("glp",0,"gln",0); m.wire("glr",0,"gsend",0)
    if walk:
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
        m.box("go", "toggle", [700, 450, 26, 26], pres=[L, Y["mrow"]+50, 26, 26], numinlets=1, numoutlets=1,
              outlettype=["int"], parameter_enable=0)
        m.com("gol", "walk", [730, 452, 50, 20], pres=[L+32, Y["mrow"]+53, 50, 20])
        ss_out = logslider("ss", "step size", "", 0.01, 1.0, L+130, 820, False)
        ms_out = logslider("ms", "step every", "ms", 20, 2000, L+260, 1000, True)
        m.obj("pss", "prepend stepsize", [820, 600, 110, 22], 1, 1)
        m.wire(ss_out,0,"pss",0); m.wire("pss",0,"walk",0)
        m.obj("met", "metro 200", [700, 630, 80, 22], 2, 1)
        m.obj("sg", f"s {NS}.glide", [1000, 630, 90, 22], 1, 0)
        m.wire("go",0,"met",0); m.wire(ms_out,0,"met",1); m.wire(ms_out,0,"sg",0); m.wire("met",0,"walk",0)

    if phone:
        bp = dict(numinlets=0, viewvisibility=1, enablehscroll=0, enablevscroll=0, lockeddragscroll=0, offset=[0.0, 0.0])
        m.box("qr", "bpatcher", [700, 20, 258, 312], pres=[630, 20, 258, 312], name="ap.qr.maxpat", numoutlets=0, **bp)
        m.box("recv", "bpatcher", [700, 340, 208, 126], pres=[630, 344, 208, 126], name="ap.receive.maxpat", numoutlets=0, **bp)
        for key, ch, x in [("tatt", "ap.attitude", 700), ("tgyr", "ap.gyro", 960), ("tacc", "ap.accel", 1220)]:
            m.box(key, "bpatcher", [x, 480, 246, 24], name="ap.channel.maxpat", args=[ch], numoutlets=6, outlettype=[""]*6, **bp)
        m.com("motionc", "1 tilt  ·  2 roll  ·  3 spin  ·  4 shake\n5–7 spin x y z  ·  8–10 shake x y z  ·  11–16 still",
              [700, 510, 400, 40], pres=[L, Y["motion"], 560, 40], textcolor=GREY)
        # each motion: its range -> -1..1, clipped, times the spread. Spin and shake are never negative,
        # so their range is centred on 0: holding still is the middle of the latent space.
        MOTIONS = [("tatt", 2, -90, 90), ("tatt", 3, -90, 90),      # tilt, roll (degrees)
                   ("tgyr", 5, -8, 8), ("tacc", 5, -15, 15),        # spin, shake (magnitudes)
                   ("tgyr", 1, -6, 6), ("tgyr", 2, -6, 6), ("tgyr", 3, -6, 6),       # spin x y z (rad/s)
                   ("tacc", 1, -10, 10), ("tacc", 2, -10, 10), ("tacc", 3, -10, 10)]  # shake x y z (m/s²)
        m.obj("pak", "pak " + " ".join(["f"]*len(MOTIONS)), [700, 640, 400, 22], len(MOTIONS), 1)
        for k, (src, o, lo, hi) in enumerate(MOTIONS):
            x = 700 + k*130
            m.obj(f"sc{k}", f"scale {lo}. {hi}. -1. 1.", [x, 540, 125, 22], 6, 1)
            m.obj(f"cl{k}", "clip -1. 1.", [x, 570, 80, 22], 3, 1)
            m.obj(f"sp{k}", "* 1.5", [x, 600, 50, 22], 2, 1)
            m.wire(src, o, f"sc{k}", 0); m.wire(f"sc{k}",0,f"cl{k}",0); m.wire(f"cl{k}",0,f"sp{k}",0); m.wire(f"sp{k}",0,"pak",k)
        # to the decoder at sensor rate; to the bars at most 4 times a second
        m.obj("hub", "t l l", [700, 670, 100, 22], 1, 2)
        m.obj("paint", "zl reg", [820, 730, 60, 22], 2, 2)
        m.obj("clock", "qmetro 250", [820, 700, 80, 22], 2, 1)
        m.msg("clock1", "1", [910, 670, 30, 22])
        m.obj("chg", "zl change", [820, 760, 80, 22], 2, 2)
        m.obj("pset", "prepend setlist", [820, 790, 100, 22], 1, 1)
        m.obj("pcut", "zl slice 4", [820, 670, 80, 22], 2, 2); m.obj("prn", f"r {NS}.n", [910, 640, 70, 22], 0, 1)
        m.wire("pak",0,"hub",0); m.wire("hub",1,"smooth",0); m.wire("hub",0,"pcut",0); m.wire("prn",0,"pcut",1)
        m.wire("pcut",0,"paint",1)   # only as many values as the model has bars
        m.wire("lb",0,"clock1",0); m.wire("clock1",0,"clock",0); m.wire("clock",0,"paint",0)
        m.wire("paint",0,"chg",0); m.wire("chg",0,"pset",0); m.wire("pset",0,"bars",0)
        m.com("metah", "mapping", [700, 400, 200, 22], pres=[L, Y["meta"], 300, 22], fontsize=15.0)
        sp_out = logslider("spr", "spread", "", 0.5, 4.5, L, 1000, False)
        sm_out = logslider("smo", "smoothing", "ms", 15, 1500, L+130, 1200, True)
        for k in range(len(MOTIONS)): m.wire(sp_out, 0, f"sp{k}", 1)
        m.obj("sg", f"s {NS}.glide", [1200, 640, 90, 22], 1, 0)
        m.wire(sm_out,0,"sg",0)

    m.obj("rave", "nn~ sol_ordinario decode", [40, 700, 300, 22], 4, 1, varname="rave", pres=[L, Y["nn"], 560, 26], fontsize=14.0)
    for k in range(4): m.wire("smooth",k,"rave",k)
    m.box("vol", "gain~", [40, 740, 200, 26], pres=[L, Y["vol"], 220, 26], varname="vol", numinlets=2, numoutlets=2,
          outlettype=["signal",""], parameter_enable=0)
    m.wire("v0",0,"vol",0)
    m.com("volc", "volume", [250, 745, 80, 20], pres=[L+228, Y["vol"]+3, 80, 20], textcolor=GREY)
    m.box("dac", "ezdac~", [40, 785, 45, 45], pres=[L+515, Y["vol"]-10, 45, 45], numinlets=2, numoutlets=0)
    m.com("dacc", "sound", [95, 800, 60, 20], pres=[L+462, Y["vol"]+3, 50, 20], textcolor=GREY)
    m.wire("rave",0,"vol",0); m.wire("vol",0,"dac",0); m.wire("vol",0,"dac",1)
    return {"patcher": patcher(m.boxes, m.lines, [80, 60, 910 if phone else 640, Y["h"]], openinpresentation=1)}

root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for kind, name in [("hand", "1. decoder by hand.maxpat"), ("capture", "2. capture and return.maxpat"),
                   ("walk", "3. random walk.maxpat"), ("phone", "4. phone to rave.maxpat")]:
    json.dump(build(kind), open(os.path.join(root, name), "w"), indent=1)
    print("wrote", name)
