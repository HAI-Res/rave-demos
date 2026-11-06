{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 6,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   80,
   60,
   560,
   400
  ],
  "gridsize": [
   15.0,
   15.0
  ],
  "default_fontsize": 13.0,
  "boxes": [
   {
    "box": {
     "id": "title",
     "maxclass": "comment",
     "patching_rect": [
      30,
      15,
      400,
      28
     ],
     "text": "THE SOURCE \u00b7 noise",
     "presentation": 1,
     "presentation_rect": [
      30,
      20,
      400,
      28
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 20.0
    }
   },
   {
    "box": {
     "id": "open",
     "maxclass": "textbutton",
     "patching_rect": [
      30,
      60,
      150,
      26
     ],
     "text": "THE SOURCE window",
     "presentation": 1,
     "presentation_rect": [
      30,
      66,
      150,
      26
     ],
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "to",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      90,
      30,
      22
     ],
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "om",
     "maxclass": "message",
     "patching_rect": [
      30,
      115,
      40,
      22
     ],
     "text": "open",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "vst",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      160,
      700,
      22
     ],
     "text": "vst~ 2 12 \"THE SOURCE.vst3\"",
     "numinlets": 2,
     "numoutlets": 16,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "adc",
     "maxclass": "newobj",
     "patching_rect": [
      300,
      120,
      70,
      22
     ],
     "text": "adc~ 1 2",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "snl",
     "maxclass": "comment",
     "patching_rect": [
      430,
      200,
      60,
      20
     ],
     "text": "sound",
     "presentation": 1,
     "presentation_rect": [
      30,
      112,
      80,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "snd",
     "maxclass": "umenu",
     "patching_rect": [
      430,
      220,
      140,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      132,
      140,
      26
     ],
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": [
      "noise",
      ",",
      "oscillator"
     ],
     "parameter_enable": 0,
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "sndm",
     "maxclass": "message",
     "patching_rect": [
      430,
      250,
      70,
      22
     ],
     "text": "sound $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sl",
     "maxclass": "comment",
     "patching_rect": [
      30,
      200,
      60,
      20
     ],
     "text": "signal",
     "presentation": 1,
     "presentation_rect": [
      180,
      112,
      80,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "sig",
     "maxclass": "umenu",
     "patching_rect": [
      30,
      220,
      180,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      180,
      132,
      170,
      26
     ],
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": [
      "1 Raw ECG",
      ",",
      "2 Cooked ECG",
      ",",
      "3 BPM",
      ",",
      "4 R2R",
      ",",
      "5 Valence",
      ",",
      "6 Arousal",
      ",",
      "7 RSP",
      ",",
      "8 RSP Rate",
      ",",
      "9 RSP Effort",
      ",",
      "10 Touch Plate",
      ",",
      "11 Unused",
      ",",
      "12 Unused"
     ],
     "parameter_enable": 0,
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "p1",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      250,
      40,
      22
     ],
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sel",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      280,
      700,
      22
     ],
     "text": "selector~ 12 2",
     "numinlets": 13,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "gen",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      320,
      200,
      22
     ],
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "dsp.gen",
      "rect": [
       100,
       100,
       620,
       660
      ],
      "gridsize": [
       15.0,
       15.0
      ],
      "default_fontsize": 13.0,
      "boxes": [
       {
        "box": {
         "id": "in",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          20,
          30,
          22
         ],
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "code",
         "maxclass": "codebox",
         "patching_rect": [
          20,
          60,
          560,
          520
         ],
         "code": "// PolyBLEP: removes the aliasing of a hard edge in the saw and square\nblep(t, dt) {\n    if (t < dt) { u = t / dt; return u + u - u * u - 1; }\n    else if (t > 1 - dt) { u = (t - 1) / dt; return u * u + u + u + 1; }\n    else { return 0; }\n}\nParam sound(0, min=0, max=1);\nParam freq(220, min=40, max=2000);\nParam msin(1, min=0, max=1);\nParam mtri(0, min=0, max=1);\nParam msaw(0, min=0, max=1);\nParam msqr(0, min=0, max=1);\nHistory ph(0);\nParam depth(1, min=0, max=1);\nParam smoothing(100, min=5, max=2000);\nParam drives(0, min=0, max=2);   // 0: the signal drives loudness\nHistory mn(0);\nHistory mx(0);\nHistory started(0);\nHistory c(0);\nHistory lpl(0);\nHistory lpr(0);\n// the input is normalised to 0..1 by tracking its own range (forgets over ~10 s)\nx = in1;\nif (started == 0) { mn = x; mx = x; started = 1; }\nrk = 1 - exp(-1 / (10 * samplerate));\nif (x > mx) { mx = x; } else { mx = mx - (mx - x) * rk; }\nif (x < mn) { mn = x; } else { mn = mn + (x - mn) * rk; }\nr = mx - mn;\nn = (r > 0.000001) ? (x - mn) / r : 0;\nsk = 1 - exp(-1 / (smoothing * 0.001 * samplerate));\nc = c + (n - c) * sk;\nm = 1 - depth + depth * c;\nlevel = (drives == 1) ? 1 : m;\nbright = (drives == 0) ? 1 : m;\nfc = 200 * pow(60, bright);\na = 1 - exp(-2 * pi * fc / samplerate);\nlpl = lpl + (noise() - lpl) * a;\nlpr = lpr + (noise() - lpr) * a;\n// oscillator: a mix of four waves, its loudness following the signal\ndt = freq / samplerate;\nph = ph + dt;\nif (ph >= 1) { ph = ph - 1; }\np2 = ph + 0.5;\nif (p2 >= 1) { p2 = p2 - 1; }\nosin = sin(2 * pi * ph);\notri = 1 - 4 * abs(ph - 0.5);\nosaw = 2 * ph - 1 - blep(ph, dt);\nosqr = ((ph < 0.5) ? 1 : -1) + blep(ph, dt) - blep(p2, dt);\nmsum = msin + mtri + msaw + msqr;\nmnorm = (msum > 1) ? 1 / msum : 1;\nosc = (msin * osin + mtri * otri + msaw * osaw + msqr * osqr) * mnorm * m;\n// sound 0: noise, sound 1: oscillator\nout1 = (sound < 0.5) ? lpl * level : osc;\nout2 = (sound < 0.5) ? lpr * level : osc;",
         "numinlets": 1,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ],
         "fontface": 0,
         "fontsize": 12.0
        }
       },
       {
        "box": {
         "id": "o1",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          600,
          40,
          22
         ],
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "o2",
         "maxclass": "newobj",
         "patching_rect": [
          120,
          600,
          40,
          22
         ],
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "in",
          0
         ],
         "destination": [
          "code",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "code",
          0
         ],
         "destination": [
          "o1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "code",
          1
         ],
         "destination": [
          "o2",
          0
         ]
        }
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "lb",
     "maxclass": "newobj",
     "patching_rect": [
      400,
      15,
      65,
      22
     ],
     "text": "loadbang",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "snd0",
     "maxclass": "message",
     "patching_rect": [
      440,
      45,
      30,
      22
     ],
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sig0",
     "maxclass": "message",
     "patching_rect": [
      480,
      15,
      30,
      22
     ],
     "text": "1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "v0",
     "maxclass": "message",
     "patching_rect": [
      560,
      15,
      40,
      22
     ],
     "text": "100",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "depl",
     "maxclass": "comment",
     "patching_rect": [
      400,
      360,
      90,
      20
     ],
     "text": "depth",
     "presentation": 1,
     "presentation_rect": [
      30,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "deps",
     "maxclass": "slider",
     "patching_rect": [
      400,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      34,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "depx",
     "maxclass": "newobj",
     "patching_rect": [
      400,
      470,
      150,
      22
     ],
     "text": "expr 0+(1)*$f1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "depps",
     "maxclass": "newobj",
     "patching_rect": [
      470,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "depn",
     "maxclass": "flonum",
     "patching_rect": [
      400,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      294,
      56,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0,
     "numdecimalplaces": 2
    }
   },
   {
    "box": {
     "id": "depu",
     "maxclass": "comment",
     "patching_rect": [
      460,
      530,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      88,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "dep0",
     "maxclass": "message",
     "patching_rect": [
      400,
      335,
      35,
      22
     ],
     "text": "1.0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "smol",
     "maxclass": "comment",
     "patching_rect": [
      600,
      360,
      90,
      20
     ],
     "text": "smoothing",
     "presentation": 1,
     "presentation_rect": [
      160,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "smos",
     "maxclass": "slider",
     "patching_rect": [
      600,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      164,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "smox",
     "maxclass": "newobj",
     "patching_rect": [
      600,
      470,
      150,
      22
     ],
     "text": "expr 5*pow(400.0,$f1)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "smor",
     "maxclass": "newobj",
     "patching_rect": [
      600,
      500,
      60,
      22
     ],
     "text": "round 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "smops",
     "maxclass": "newobj",
     "patching_rect": [
      670,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "smon",
     "maxclass": "number",
     "patching_rect": [
      600,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      160,
      294,
      56,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "smou",
     "maxclass": "comment",
     "patching_rect": [
      660,
      530,
      30,
      20
     ],
     "text": "ms",
     "presentation": 1,
     "presentation_rect": [
      218,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "smo0",
     "maxclass": "message",
     "patching_rect": [
      600,
      335,
      35,
      22
     ],
     "text": "0.6",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "frql",
     "maxclass": "comment",
     "patching_rect": [
      800,
      360,
      90,
      20
     ],
     "text": "frequency",
     "presentation": 1,
     "presentation_rect": [
      250,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "frqs",
     "maxclass": "slider",
     "patching_rect": [
      800,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      254,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "frqx",
     "maxclass": "newobj",
     "patching_rect": [
      800,
      470,
      150,
      22
     ],
     "text": "expr 40*pow(50.0,$f1)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "frqr",
     "maxclass": "newobj",
     "patching_rect": [
      800,
      500,
      60,
      22
     ],
     "text": "round 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "frqps",
     "maxclass": "newobj",
     "patching_rect": [
      870,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "frqn",
     "maxclass": "number",
     "patching_rect": [
      800,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      250,
      294,
      56,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "frqu",
     "maxclass": "comment",
     "patching_rect": [
      860,
      530,
      30,
      20
     ],
     "text": "Hz",
     "presentation": 1,
     "presentation_rect": [
      308,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "frq0",
     "maxclass": "message",
     "patching_rect": [
      800,
      335,
      35,
      22
     ],
     "text": "0.4358",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "frqm",
     "maxclass": "message",
     "patching_rect": [
      800,
      560,
      70,
      22
     ],
     "text": "freq $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msinl",
     "maxclass": "comment",
     "patching_rect": [
      1000,
      360,
      90,
      20
     ],
     "text": "sin",
     "presentation": 1,
     "presentation_rect": [
      360,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "msins",
     "maxclass": "slider",
     "patching_rect": [
      1000,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      364,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "msinx",
     "maxclass": "newobj",
     "patching_rect": [
      1000,
      470,
      150,
      22
     ],
     "text": "expr 0+(1)*$f1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msinps",
     "maxclass": "newobj",
     "patching_rect": [
      1070,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msinn",
     "maxclass": "flonum",
     "patching_rect": [
      1000,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      360,
      294,
      44,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0,
     "numdecimalplaces": 2
    }
   },
   {
    "box": {
     "id": "msinu",
     "maxclass": "comment",
     "patching_rect": [
      1060,
      530,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      406,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "msin0",
     "maxclass": "message",
     "patching_rect": [
      1000,
      335,
      35,
      22
     ],
     "text": "1.0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msinm",
     "maxclass": "message",
     "patching_rect": [
      1000,
      560,
      70,
      22
     ],
     "text": "msin $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "mtril",
     "maxclass": "comment",
     "patching_rect": [
      1160,
      360,
      90,
      20
     ],
     "text": "tri",
     "presentation": 1,
     "presentation_rect": [
      408,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "mtris",
     "maxclass": "slider",
     "patching_rect": [
      1160,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      412,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "mtrix",
     "maxclass": "newobj",
     "patching_rect": [
      1160,
      470,
      150,
      22
     ],
     "text": "expr 0+(1)*$f1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "mtrips",
     "maxclass": "newobj",
     "patching_rect": [
      1230,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "mtrin",
     "maxclass": "flonum",
     "patching_rect": [
      1160,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      408,
      294,
      44,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0,
     "numdecimalplaces": 2
    }
   },
   {
    "box": {
     "id": "mtriu",
     "maxclass": "comment",
     "patching_rect": [
      1220,
      530,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      454,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "mtri0",
     "maxclass": "message",
     "patching_rect": [
      1160,
      335,
      35,
      22
     ],
     "text": "0.0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "mtrim",
     "maxclass": "message",
     "patching_rect": [
      1160,
      560,
      70,
      22
     ],
     "text": "mtri $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msawl",
     "maxclass": "comment",
     "patching_rect": [
      1320,
      360,
      90,
      20
     ],
     "text": "saw",
     "presentation": 1,
     "presentation_rect": [
      456,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "msaws",
     "maxclass": "slider",
     "patching_rect": [
      1320,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      460,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "msawx",
     "maxclass": "newobj",
     "patching_rect": [
      1320,
      470,
      150,
      22
     ],
     "text": "expr 0+(1)*$f1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msawps",
     "maxclass": "newobj",
     "patching_rect": [
      1390,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msawn",
     "maxclass": "flonum",
     "patching_rect": [
      1320,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      456,
      294,
      44,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0,
     "numdecimalplaces": 2
    }
   },
   {
    "box": {
     "id": "msawu",
     "maxclass": "comment",
     "patching_rect": [
      1380,
      530,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      502,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "msaw0",
     "maxclass": "message",
     "patching_rect": [
      1320,
      335,
      35,
      22
     ],
     "text": "0.0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msawm",
     "maxclass": "message",
     "patching_rect": [
      1320,
      560,
      70,
      22
     ],
     "text": "msaw $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msqrl",
     "maxclass": "comment",
     "patching_rect": [
      1480,
      360,
      90,
      20
     ],
     "text": "sqr",
     "presentation": 1,
     "presentation_rect": [
      504,
      184,
      90,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "msqrs",
     "maxclass": "slider",
     "patching_rect": [
      1480,
      385,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      508,
      208,
      22,
      80
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "floatoutput": 1,
     "size": 1.0,
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "msqrx",
     "maxclass": "newobj",
     "patching_rect": [
      1480,
      470,
      150,
      22
     ],
     "text": "expr 0+(1)*$f1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msqrps",
     "maxclass": "newobj",
     "patching_rect": [
      1550,
      500,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msqrn",
     "maxclass": "flonum",
     "patching_rect": [
      1480,
      530,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      504,
      294,
      44,
      24
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "ignoreclick": 1,
     "parameter_enable": 0,
     "fontsize": 14.0,
     "numdecimalplaces": 2
    }
   },
   {
    "box": {
     "id": "msqru",
     "maxclass": "comment",
     "patching_rect": [
      1540,
      530,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      550,
      296,
      30,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "msqr0",
     "maxclass": "message",
     "patching_rect": [
      1480,
      335,
      35,
      22
     ],
     "text": "0.0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msqrm",
     "maxclass": "message",
     "patching_rect": [
      1480,
      560,
      70,
      22
     ],
     "text": "msqr $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "depm",
     "maxclass": "message",
     "patching_rect": [
      400,
      560,
      70,
      22
     ],
     "text": "depth $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "smom",
     "maxclass": "message",
     "patching_rect": [
      600,
      560,
      90,
      22
     ],
     "text": "smoothing $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "vol",
     "maxclass": "gain~",
     "patching_rect": [
      30,
      600,
      200,
      26
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      336,
      220,
      26
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      ""
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "volc",
     "maxclass": "comment",
     "patching_rect": [
      240,
      603,
      80,
      20
     ],
     "text": "volume",
     "presentation": 1,
     "presentation_rect": [
      258,
      339,
      80,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "dac",
     "maxclass": "ezdac~",
     "patching_rect": [
      30,
      640,
      45,
      45
     ],
     "presentation": 1,
     "presentation_rect": [
      360,
      326,
      45,
      45
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "dacc",
     "maxclass": "comment",
     "patching_rect": [
      80,
      655,
      60,
      20
     ],
     "text": "sound",
     "presentation": 1,
     "presentation_rect": [
      308,
      339,
      50,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "textcolor": [
      0.45,
      0.45,
      0.45,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "volr",
     "maxclass": "gain~",
     "patching_rect": [
      250,
      640,
      200,
      26
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      ""
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "tp",
     "maxclass": "newobj",
     "patching_rect": [
      480,
      60,
      80,
      22
     ],
     "text": "thispatcher",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "dfl",
     "maxclass": "newobj",
     "patching_rect": [
      480,
      90,
      65,
      22
     ],
     "text": "deferlow",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "pres1",
     "maxclass": "message",
     "patching_rect": [
      480,
      115,
      100,
      22
     ],
     "text": "presentation 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "open",
      0
     ],
     "destination": [
      "to",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "to",
      0
     ],
     "destination": [
      "om",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "om",
      0
     ],
     "destination": [
      "vst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "adc",
      0
     ],
     "destination": [
      "vst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "adc",
      1
     ],
     "destination": [
      "vst",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "snd",
      0
     ],
     "destination": [
      "sndm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sig",
      0
     ],
     "destination": [
      "p1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p1",
      0
     ],
     "destination": [
      "sel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      0
     ],
     "destination": [
      "sel",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      1
     ],
     "destination": [
      "sel",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      2
     ],
     "destination": [
      "sel",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      3
     ],
     "destination": [
      "sel",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      4
     ],
     "destination": [
      "sel",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      5
     ],
     "destination": [
      "sel",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      6
     ],
     "destination": [
      "sel",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      7
     ],
     "destination": [
      "sel",
      8
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      8
     ],
     "destination": [
      "sel",
      9
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      9
     ],
     "destination": [
      "sel",
      10
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      10
     ],
     "destination": [
      "sel",
      11
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vst",
      11
     ],
     "destination": [
      "sel",
      12
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sndm",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "snd0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "snd0",
      0
     ],
     "destination": [
      "snd",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "sig0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sig0",
      0
     ],
     "destination": [
      "sig",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "dep0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dep0",
      0
     ],
     "destination": [
      "deps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "deps",
      0
     ],
     "destination": [
      "depx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "depx",
      0
     ],
     "destination": [
      "depps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "depps",
      0
     ],
     "destination": [
      "depn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smox",
      0
     ],
     "destination": [
      "smor",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "smo0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smo0",
      0
     ],
     "destination": [
      "smos",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smos",
      0
     ],
     "destination": [
      "smox",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smor",
      0
     ],
     "destination": [
      "smops",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smops",
      0
     ],
     "destination": [
      "smon",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frqx",
      0
     ],
     "destination": [
      "frqr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "frq0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frq0",
      0
     ],
     "destination": [
      "frqs",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frqs",
      0
     ],
     "destination": [
      "frqx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frqr",
      0
     ],
     "destination": [
      "frqps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frqps",
      0
     ],
     "destination": [
      "frqn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frqr",
      0
     ],
     "destination": [
      "frqm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "frqm",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "msin0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msin0",
      0
     ],
     "destination": [
      "msins",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msins",
      0
     ],
     "destination": [
      "msinx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msinx",
      0
     ],
     "destination": [
      "msinps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msinps",
      0
     ],
     "destination": [
      "msinn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msinx",
      0
     ],
     "destination": [
      "msinm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msinm",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "mtri0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mtri0",
      0
     ],
     "destination": [
      "mtris",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mtris",
      0
     ],
     "destination": [
      "mtrix",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mtrix",
      0
     ],
     "destination": [
      "mtrips",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mtrips",
      0
     ],
     "destination": [
      "mtrin",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mtrix",
      0
     ],
     "destination": [
      "mtrim",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mtrim",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "msaw0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msaw0",
      0
     ],
     "destination": [
      "msaws",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msaws",
      0
     ],
     "destination": [
      "msawx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msawx",
      0
     ],
     "destination": [
      "msawps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msawps",
      0
     ],
     "destination": [
      "msawn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msawx",
      0
     ],
     "destination": [
      "msawm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msawm",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "msqr0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msqr0",
      0
     ],
     "destination": [
      "msqrs",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msqrs",
      0
     ],
     "destination": [
      "msqrx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msqrx",
      0
     ],
     "destination": [
      "msqrps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msqrps",
      0
     ],
     "destination": [
      "msqrn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msqrx",
      0
     ],
     "destination": [
      "msqrm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msqrm",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "depx",
      0
     ],
     "destination": [
      "depm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "depm",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smor",
      0
     ],
     "destination": [
      "smom",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smom",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "v0",
      0
     ],
     "destination": [
      "vol",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "v0",
      0
     ],
     "destination": [
      "volr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vol",
      1
     ],
     "destination": [
      "volr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gen",
      0
     ],
     "destination": [
      "vol",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gen",
      1
     ],
     "destination": [
      "volr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vol",
      0
     ],
     "destination": [
      "dac",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "volr",
      0
     ],
     "destination": [
      "dac",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "dfl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dfl",
      0
     ],
     "destination": [
      "pres1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pres1",
      0
     ],
     "destination": [
      "tp",
      0
     ]
    }
   }
  ],
  "openinpresentation": 1
 }
}