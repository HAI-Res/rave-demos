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
   440,
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
      30,
      132,
      180,
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
     "id": "dl",
     "maxclass": "comment",
     "patching_rect": [
      230,
      200,
      60,
      20
     ],
     "text": "drives",
     "presentation": 1,
     "presentation_rect": [
      230,
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
     "id": "drv",
     "maxclass": "umenu",
     "patching_rect": [
      230,
      220,
      140,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      230,
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
      "loudness",
      ",",
      "brightness",
      ",",
      "both"
     ],
     "parameter_enable": 0,
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "dm",
     "maxclass": "message",
     "patching_rect": [
      230,
      250,
      70,
      22
     ],
     "text": "drives $1",
     "numinlets": 2,
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
         "code": "Param depth(1, min=0, max=1);\nParam smoothing(100, min=5, max=2000);\nParam drives(2, min=0, max=2);\nHistory mn(0);\nHistory mx(0);\nHistory started(0);\nHistory c(0);\nHistory lpl(0);\nHistory lpr(0);\n// the input is normalised to 0..1 by tracking its own range (forgets over ~10 s)\nx = in1;\nif (started == 0) { mn = x; mx = x; started = 1; }\nrk = 1 - exp(-1 / (10 * samplerate));\nif (x > mx) { mx = x; } else { mx = mx - (mx - x) * rk; }\nif (x < mn) { mn = x; } else { mn = mn + (x - mn) * rk; }\nr = mx - mn;\nn = (r > 0.000001) ? (x - mn) / r : 0;\nsk = 1 - exp(-1 / (smoothing * 0.001 * samplerate));\nc = c + (n - c) * sk;\nm = 1 - depth + depth * c;\nlevel = (drives == 1) ? 1 : m;\nbright = (drives == 0) ? 1 : m;\nfc = 200 * pow(60, bright);\na = 1 - exp(-2 * pi * fc / samplerate);\nlpl = lpl + (noise() - lpl) * a;\nlpr = lpr + (noise() - lpr) * a;\nout1 = lpl * level;\nout2 = lpr * level;",
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
     "id": "drv0",
     "maxclass": "message",
     "patching_rect": [
      520,
      15,
      30,
      22
     ],
     "text": "2",
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
      "drv",
      0
     ],
     "destination": [
      "dm",
      0
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
      "dm",
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
      "drv0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "drv0",
      0
     ],
     "destination": [
      "drv",
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