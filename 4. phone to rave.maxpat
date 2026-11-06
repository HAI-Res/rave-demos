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
   910,
   700
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
      500,
      28
     ],
     "text": "RAVE 4 \u00b7 the phone",
     "presentation": 1,
     "presentation_rect": [
      30,
      20,
      560,
      28
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 20.0
    }
   },
   {
    "box": {
     "id": "mlab",
     "maxclass": "comment",
     "patching_rect": [
      30,
      80,
      80,
      20
     ],
     "text": "model",
     "presentation": 1,
     "presentation_rect": [
      30,
      58,
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
     "id": "menu",
     "maxclass": "umenu",
     "patching_rect": [
      30,
      100,
      200,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      78,
      210,
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
      "sol_ordinario",
      ",",
      "sol_ordinario_fast",
      ",",
      "sol_full",
      ",",
      "isis",
      ",",
      "VCTK",
      ",",
      "nasa",
      ",",
      "percussion",
      ",",
      "musicnet",
      ",",
      "vintage"
     ],
     "parameter_enable": 0,
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "info",
     "maxclass": "newobj",
     "patching_rect": [
      430,
      140,
      90,
      22
     ],
     "text": "r rave4.info",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "what",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      140,
      90,
      22
     ],
     "text": "r rave4.what",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "infoc",
     "maxclass": "comment",
     "patching_rect": [
      250,
      170,
      380,
      20
     ],
     "text": "4 dimensions",
     "presentation": 1,
     "presentation_rect": [
      30,
      110,
      560,
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
     "id": "mdl",
     "maxclass": "newobj",
     "patching_rect": [
      250,
      100,
      70,
      22
     ],
     "text": "p model",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
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
      "classnamespace": "box",
      "rect": [
       100,
       100,
       700,
       540
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
         "maxclass": "inlet",
         "patching_rect": [
          20,
          20,
          30,
          22
         ],
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "rt",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          60,
          540,
          22
         ],
         "text": "route 0 1 2 3 4 5 6 7 8",
         "numinlets": 1,
         "numoutlets": 10,
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
          ""
         ]
        }
       },
       {
        "box": {
         "id": "out",
         "maxclass": "outlet",
         "patching_rect": [
          20,
          420,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "t0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s0",
         "maxclass": "message",
         "patching_rect": [
          20,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_ordinario decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u0",
         "maxclass": "message",
         "patching_rect": [
          20,
          180,
          55,
          22
         ],
         "text": "; rave4.n 4; rave4.bars size 4; rave4.bars 0 0 0 0; rave4.info set 4 dimensions; rave4.what set trained on orchestral instruments \u00b7 ordinary playing (IRCAM SOL); rave4.url symbol https://zenodo.org/records/3685331",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t1",
         "maxclass": "newobj",
         "patching_rect": [
          80,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s1",
         "maxclass": "message",
         "patching_rect": [
          80,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_ordinario_fast decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u1",
         "maxclass": "message",
         "patching_rect": [
          80,
          180,
          55,
          22
         ],
         "text": "; rave4.n 8; rave4.bars size 8; rave4.bars 0 0 0 0 0 0 0 0; rave4.info set 8 dimensions; rave4.what set trained on the same sounds \u00b7 a smaller faster model; rave4.url symbol https://zenodo.org/records/3685331",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t2",
         "maxclass": "newobj",
         "patching_rect": [
          140,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s2",
         "maxclass": "message",
         "patching_rect": [
          140,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_full decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u2",
         "maxclass": "message",
         "patching_rect": [
          140,
          180,
          55,
          22
         ],
         "text": "; rave4.n 8; rave4.bars size 8; rave4.bars 0 0 0 0 0 0 0 0; rave4.info set 8 dimensions; rave4.what set trained on orchestral instruments \u00b7 every playing technique (IRCAM SOL); rave4.url symbol https://zenodo.org/records/3685331",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t3",
         "maxclass": "newobj",
         "patching_rect": [
          200,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s3",
         "maxclass": "message",
         "patching_rect": [
          200,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ isis decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u3",
         "maxclass": "message",
         "patching_rect": [
          200,
          180,
          55,
          22
         ],
         "text": "; rave4.n 8; rave4.bars size 8; rave4.bars 0 0 0 0 0 0 0 0; rave4.info set 8 dimensions; rave4.what set trained on three singers recorded for IRCAM's ISiS synthesizer; rave4.url symbol https://isis-documentation.readthedocs.io/en/latest/voice_installation.html",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t4",
         "maxclass": "newobj",
         "patching_rect": [
          260,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s4",
         "maxclass": "message",
         "patching_rect": [
          260,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ VCTK decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u4",
         "maxclass": "message",
         "patching_rect": [
          260,
          180,
          55,
          22
         ],
         "text": "; rave4.n 8; rave4.bars size 8; rave4.bars 0 0 0 0 0 0 0 0; rave4.info set 8 dimensions; rave4.what set trained on speech \u00b7 110 English speakers reading aloud; rave4.url symbol https://huggingface.co/datasets/CSTR-Edinburgh/vctk",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t5",
         "maxclass": "newobj",
         "patching_rect": [
          320,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s5",
         "maxclass": "message",
         "patching_rect": [
          320,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ nasa decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u5",
         "maxclass": "message",
         "patching_rect": [
          320,
          180,
          55,
          22
         ],
         "text": "; rave4.n 8; rave4.bars size 8; rave4.bars 0 0 0 0 0 0 0 0; rave4.info set 8 dimensions; rave4.what set trained on radio from the Apollo 11 mission; rave4.url symbol https://www.youtube.com/watch?v=DejhGSEu8wk",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t6",
         "maxclass": "newobj",
         "patching_rect": [
          380,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s6",
         "maxclass": "message",
         "patching_rect": [
          380,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ percussion decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u6",
         "maxclass": "message",
         "patching_rect": [
          380,
          180,
          55,
          22
         ],
         "text": "; rave4.n 4; rave4.bars size 4; rave4.bars 0 0 0 0; rave4.info set 4 dimensions; rave4.what set trained on 8 hours of percussion (never published); rave4.url symbol -",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t7",
         "maxclass": "newobj",
         "patching_rect": [
          440,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s7",
         "maxclass": "message",
         "patching_rect": [
          440,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ musicnet decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect smooth 8 rave 8, script connect smooth 9 rave 9, script connect smooth 10 rave 10, script connect smooth 11 rave 11, script connect smooth 12 rave 12, script connect smooth 13 rave 13, script connect smooth 14 rave 14, script connect smooth 15 rave 15, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u7",
         "maxclass": "message",
         "patching_rect": [
          440,
          180,
          55,
          22
         ],
         "text": "; rave4.n 16; rave4.bars size 16; rave4.bars 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; rave4.info set 16 dimensions; rave4.what set trained on 330 classical recordings (MusicNet); rave4.url symbol https://zenodo.org/records/5120004",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "t8",
         "maxclass": "newobj",
         "patching_rect": [
          500,
          100,
          40,
          22
         ],
         "text": "t b b",
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
         "id": "s8",
         "maxclass": "message",
         "patching_rect": [
          500,
          140,
          55,
          22
         ],
         "text": "script delete rave, script newdefault rave 40 700 nn~ vintage decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect smooth 8 rave 8, script connect smooth 9 rave 9, script connect smooth 10 rave 10, script connect smooth 11 rave 11, script connect smooth 12 rave 12, script connect smooth 13 rave 13, script connect smooth 14 rave 14, script connect smooth 15 rave 15, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 590 560 26",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "u8",
         "maxclass": "message",
         "patching_rect": [
          500,
          180,
          55,
          22
         ],
         "text": "; rave4.n 16; rave4.bars size 16; rave4.bars 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; rave4.info set 16 dimensions; rave4.what set trained on 80 hours of vintage music (never published); rave4.url symbol -",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "c",
         "maxclass": "comment",
         "patching_rect": [
          20,
          470,
          520,
          40
         ],
         "text": "nn~ cannot swap models while running, so choosing one deletes the nn~ box and scripts a new one, wired to exactly as many dimensions as that model has.",
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
          "rt",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          0
         ],
         "destination": [
          "t0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t0",
          1
         ],
         "destination": [
          "s0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t0",
          0
         ],
         "destination": [
          "u0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s0",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          1
         ],
         "destination": [
          "t1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t1",
          1
         ],
         "destination": [
          "s1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t1",
          0
         ],
         "destination": [
          "u1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s1",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          2
         ],
         "destination": [
          "t2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t2",
          1
         ],
         "destination": [
          "s2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t2",
          0
         ],
         "destination": [
          "u2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s2",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          3
         ],
         "destination": [
          "t3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t3",
          1
         ],
         "destination": [
          "s3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t3",
          0
         ],
         "destination": [
          "u3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s3",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          4
         ],
         "destination": [
          "t4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t4",
          1
         ],
         "destination": [
          "s4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t4",
          0
         ],
         "destination": [
          "u4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s4",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          5
         ],
         "destination": [
          "t5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t5",
          1
         ],
         "destination": [
          "s5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t5",
          0
         ],
         "destination": [
          "u5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s5",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          6
         ],
         "destination": [
          "t6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t6",
          1
         ],
         "destination": [
          "s6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t6",
          0
         ],
         "destination": [
          "u6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s6",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          7
         ],
         "destination": [
          "t7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t7",
          1
         ],
         "destination": [
          "s7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t7",
          0
         ],
         "destination": [
          "u7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s7",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rt",
          8
         ],
         "destination": [
          "t8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t8",
          1
         ],
         "destination": [
          "s8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "t8",
          0
         ],
         "destination": [
          "u8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "s8",
          0
         ],
         "destination": [
          "out",
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
     "id": "tp",
     "maxclass": "newobj",
     "patching_rect": [
      330,
      100,
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
     "id": "lb",
     "maxclass": "newobj",
     "patching_rect": [
      640,
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
     "id": "m0",
     "maxclass": "message",
     "patching_rect": [
      640,
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
     "id": "v0",
     "maxclass": "message",
     "patching_rect": [
      680,
      45,
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
     "id": "dl",
     "maxclass": "newobj",
     "patching_rect": [
      560,
      15,
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
      560,
      45,
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
   },
   {
    "box": {
     "id": "data",
     "maxclass": "textbutton",
     "patching_rect": [
      800,
      100,
      150,
      26
     ],
     "text": "training data \u2197",
     "presentation": 1,
     "presentation_rect": [
      255,
      78,
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
     "id": "td",
     "maxclass": "newobj",
     "patching_rect": [
      800,
      130,
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
     "id": "ru",
     "maxclass": "newobj",
     "patching_rect": [
      860,
      130,
      80,
      22
     ],
     "text": "r rave4.url",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "ureg",
     "maxclass": "newobj",
     "patching_rect": [
      800,
      160,
      60,
      22
     ],
     "text": "zl reg",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "usel",
     "maxclass": "newobj",
     "patching_rect": [
      800,
      190,
      50,
      22
     ],
     "text": "sel -",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "ulaunch",
     "maxclass": "message",
     "patching_rect": [
      800,
      220,
      160,
      22
     ],
     "text": "; max launchbrowser $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "bars_r",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      250,
      90,
      22
     ],
     "text": "r rave4.bars",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "bars",
     "maxclass": "multislider",
     "patching_rect": [
      30,
      280,
      560,
      200
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      138,
      560,
      220
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "size": 4,
     "setminmax": [
      -3.0,
      3.0
     ],
     "setstyle": 1,
     "signed": 1,
     "parameter_enable": 0,
     "slidercolor": [
      0.3,
      0.55,
      0.75,
      1.0
     ],
     "drawpeaks": 0,
     "spacing": 6,
     "thickness": 2,
     "ignoreclick": 1
    }
   },
   {
    "box": {
     "id": "smooth",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      640,
      560,
      22
     ],
     "text": "p smooth",
     "numinlets": 1,
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
     ],
     "varname": "smooth",
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
       140,
       140,
       1020,
       300
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
         "maxclass": "inlet",
         "patching_rect": [
          20,
          20,
          30,
          22
         ],
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "up",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          60,
          960,
          22
         ],
         "text": "unpack f f f f f f f f f f f f f f f f",
         "numinlets": 1,
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
         "id": "rg",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          100,
          90,
          22
         ],
         "text": "r rave4.glide",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "m0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o0",
         "maxclass": "outlet",
         "patching_rect": [
          20,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m1",
         "maxclass": "newobj",
         "patching_rect": [
          80,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l1",
         "maxclass": "newobj",
         "patching_rect": [
          80,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o1",
         "maxclass": "outlet",
         "patching_rect": [
          80,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m2",
         "maxclass": "newobj",
         "patching_rect": [
          140,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l2",
         "maxclass": "newobj",
         "patching_rect": [
          140,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o2",
         "maxclass": "outlet",
         "patching_rect": [
          140,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m3",
         "maxclass": "newobj",
         "patching_rect": [
          200,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l3",
         "maxclass": "newobj",
         "patching_rect": [
          200,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o3",
         "maxclass": "outlet",
         "patching_rect": [
          200,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m4",
         "maxclass": "newobj",
         "patching_rect": [
          260,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l4",
         "maxclass": "newobj",
         "patching_rect": [
          260,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o4",
         "maxclass": "outlet",
         "patching_rect": [
          260,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m5",
         "maxclass": "newobj",
         "patching_rect": [
          320,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l5",
         "maxclass": "newobj",
         "patching_rect": [
          320,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o5",
         "maxclass": "outlet",
         "patching_rect": [
          320,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m6",
         "maxclass": "newobj",
         "patching_rect": [
          380,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l6",
         "maxclass": "newobj",
         "patching_rect": [
          380,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o6",
         "maxclass": "outlet",
         "patching_rect": [
          380,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m7",
         "maxclass": "newobj",
         "patching_rect": [
          440,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l7",
         "maxclass": "newobj",
         "patching_rect": [
          440,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o7",
         "maxclass": "outlet",
         "patching_rect": [
          440,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m8",
         "maxclass": "newobj",
         "patching_rect": [
          500,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l8",
         "maxclass": "newobj",
         "patching_rect": [
          500,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o8",
         "maxclass": "outlet",
         "patching_rect": [
          500,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m9",
         "maxclass": "newobj",
         "patching_rect": [
          560,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l9",
         "maxclass": "newobj",
         "patching_rect": [
          560,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o9",
         "maxclass": "outlet",
         "patching_rect": [
          560,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m10",
         "maxclass": "newobj",
         "patching_rect": [
          620,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l10",
         "maxclass": "newobj",
         "patching_rect": [
          620,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o10",
         "maxclass": "outlet",
         "patching_rect": [
          620,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m11",
         "maxclass": "newobj",
         "patching_rect": [
          680,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l11",
         "maxclass": "newobj",
         "patching_rect": [
          680,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o11",
         "maxclass": "outlet",
         "patching_rect": [
          680,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m12",
         "maxclass": "newobj",
         "patching_rect": [
          740,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l12",
         "maxclass": "newobj",
         "patching_rect": [
          740,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o12",
         "maxclass": "outlet",
         "patching_rect": [
          740,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m13",
         "maxclass": "newobj",
         "patching_rect": [
          800,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l13",
         "maxclass": "newobj",
         "patching_rect": [
          800,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o13",
         "maxclass": "outlet",
         "patching_rect": [
          800,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m14",
         "maxclass": "newobj",
         "patching_rect": [
          860,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l14",
         "maxclass": "newobj",
         "patching_rect": [
          860,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o14",
         "maxclass": "outlet",
         "patching_rect": [
          860,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "m15",
         "maxclass": "newobj",
         "patching_rect": [
          920,
          140,
          55,
          22
         ],
         "text": "pack f 30",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "l15",
         "maxclass": "newobj",
         "patching_rect": [
          920,
          175,
          45,
          22
         ],
         "text": "line~",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "o15",
         "maxclass": "outlet",
         "patching_rect": [
          920,
          215,
          30,
          22
         ],
         "numinlets": 1,
         "numoutlets": 0
        }
       },
       {
        "box": {
         "id": "c",
         "maxclass": "comment",
         "patching_rect": [
          20,
          255,
          700,
          20
         ],
         "text": "Glides between values so the decoder never hears a jump. The glide time follows the walk's step interval.",
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
          "up",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          0
         ],
         "destination": [
          "m0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m0",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m0",
          0
         ],
         "destination": [
          "l0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l0",
          0
         ],
         "destination": [
          "o0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          1
         ],
         "destination": [
          "m1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m1",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m1",
          0
         ],
         "destination": [
          "l1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l1",
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
          "up",
          2
         ],
         "destination": [
          "m2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m2",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m2",
          0
         ],
         "destination": [
          "l2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l2",
          0
         ],
         "destination": [
          "o2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          3
         ],
         "destination": [
          "m3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m3",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m3",
          0
         ],
         "destination": [
          "l3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l3",
          0
         ],
         "destination": [
          "o3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          4
         ],
         "destination": [
          "m4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m4",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m4",
          0
         ],
         "destination": [
          "l4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l4",
          0
         ],
         "destination": [
          "o4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          5
         ],
         "destination": [
          "m5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m5",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m5",
          0
         ],
         "destination": [
          "l5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l5",
          0
         ],
         "destination": [
          "o5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          6
         ],
         "destination": [
          "m6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m6",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m6",
          0
         ],
         "destination": [
          "l6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l6",
          0
         ],
         "destination": [
          "o6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          7
         ],
         "destination": [
          "m7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m7",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m7",
          0
         ],
         "destination": [
          "l7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l7",
          0
         ],
         "destination": [
          "o7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          8
         ],
         "destination": [
          "m8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m8",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m8",
          0
         ],
         "destination": [
          "l8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l8",
          0
         ],
         "destination": [
          "o8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          9
         ],
         "destination": [
          "m9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m9",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m9",
          0
         ],
         "destination": [
          "l9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l9",
          0
         ],
         "destination": [
          "o9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          10
         ],
         "destination": [
          "m10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m10",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m10",
          0
         ],
         "destination": [
          "l10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l10",
          0
         ],
         "destination": [
          "o10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          11
         ],
         "destination": [
          "m11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m11",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m11",
          0
         ],
         "destination": [
          "l11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l11",
          0
         ],
         "destination": [
          "o11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          12
         ],
         "destination": [
          "m12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m12",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m12",
          0
         ],
         "destination": [
          "l12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l12",
          0
         ],
         "destination": [
          "o12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          13
         ],
         "destination": [
          "m13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m13",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m13",
          0
         ],
         "destination": [
          "l13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l13",
          0
         ],
         "destination": [
          "o13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          14
         ],
         "destination": [
          "m14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m14",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m14",
          0
         ],
         "destination": [
          "l14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l14",
          0
         ],
         "destination": [
          "o14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "up",
          15
         ],
         "destination": [
          "m15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "rg",
          0
         ],
         "destination": [
          "m15",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "m15",
          0
         ],
         "destination": [
          "l15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "l15",
          0
         ],
         "destination": [
          "o15",
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
     "id": "qr",
     "maxclass": "bpatcher",
     "patching_rect": [
      700,
      20,
      258,
      312
     ],
     "presentation": 1,
     "presentation_rect": [
      630,
      20,
      258,
      312
     ],
     "name": "ap.qr.maxpat",
     "numoutlets": 0,
     "numinlets": 0,
     "viewvisibility": 1,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "lockeddragscroll": 0,
     "offset": [
      0.0,
      0.0
     ]
    }
   },
   {
    "box": {
     "id": "recv",
     "maxclass": "bpatcher",
     "patching_rect": [
      700,
      340,
      208,
      126
     ],
     "presentation": 1,
     "presentation_rect": [
      630,
      344,
      208,
      126
     ],
     "name": "ap.receive.maxpat",
     "numoutlets": 0,
     "numinlets": 0,
     "viewvisibility": 1,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "lockeddragscroll": 0,
     "offset": [
      0.0,
      0.0
     ]
    }
   },
   {
    "box": {
     "id": "tatt",
     "maxclass": "bpatcher",
     "patching_rect": [
      700,
      480,
      246,
      24
     ],
     "name": "ap.channel.maxpat",
     "args": [
      "ap.attitude"
     ],
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "numinlets": 0,
     "viewvisibility": 1,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "lockeddragscroll": 0,
     "offset": [
      0.0,
      0.0
     ]
    }
   },
   {
    "box": {
     "id": "tgyr",
     "maxclass": "bpatcher",
     "patching_rect": [
      960,
      480,
      246,
      24
     ],
     "name": "ap.channel.maxpat",
     "args": [
      "ap.gyro"
     ],
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "numinlets": 0,
     "viewvisibility": 1,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "lockeddragscroll": 0,
     "offset": [
      0.0,
      0.0
     ]
    }
   },
   {
    "box": {
     "id": "tacc",
     "maxclass": "bpatcher",
     "patching_rect": [
      1220,
      480,
      246,
      24
     ],
     "name": "ap.channel.maxpat",
     "args": [
      "ap.accel"
     ],
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "numinlets": 0,
     "viewvisibility": 1,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "lockeddragscroll": 0,
     "offset": [
      0.0,
      0.0
     ]
    }
   },
   {
    "box": {
     "id": "motionc",
     "maxclass": "comment",
     "patching_rect": [
      700,
      510,
      400,
      20
     ],
     "text": "z1 tilt  \u00b7  z2 roll  \u00b7  z3 spin  \u00b7  z4 shake",
     "presentation": 1,
     "presentation_rect": [
      30,
      364,
      560,
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
     "id": "pak",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      640,
      200,
      22
     ],
     "text": "pak f f f f",
     "numinlets": 4,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sc0",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      540,
      125,
      22
     ],
     "text": "scale -90. 90. -1. 1.",
     "numinlets": 6,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "cl0",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      570,
      80,
      22
     ],
     "text": "clip -1. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sp0",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      600,
      50,
      22
     ],
     "text": "* 1.5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sc1",
     "maxclass": "newobj",
     "patching_rect": [
      830,
      540,
      125,
      22
     ],
     "text": "scale -90. 90. -1. 1.",
     "numinlets": 6,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "cl1",
     "maxclass": "newobj",
     "patching_rect": [
      830,
      570,
      80,
      22
     ],
     "text": "clip -1. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sp1",
     "maxclass": "newobj",
     "patching_rect": [
      830,
      600,
      50,
      22
     ],
     "text": "* 1.5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sc2",
     "maxclass": "newobj",
     "patching_rect": [
      960,
      540,
      125,
      22
     ],
     "text": "scale -8. 8. -1. 1.",
     "numinlets": 6,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "cl2",
     "maxclass": "newobj",
     "patching_rect": [
      960,
      570,
      80,
      22
     ],
     "text": "clip -1. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sp2",
     "maxclass": "newobj",
     "patching_rect": [
      960,
      600,
      50,
      22
     ],
     "text": "* 1.5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sc3",
     "maxclass": "newobj",
     "patching_rect": [
      1090,
      540,
      125,
      22
     ],
     "text": "scale -15. 15. -1. 1.",
     "numinlets": 6,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "cl3",
     "maxclass": "newobj",
     "patching_rect": [
      1090,
      570,
      80,
      22
     ],
     "text": "clip -1. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sp3",
     "maxclass": "newobj",
     "patching_rect": [
      1090,
      600,
      50,
      22
     ],
     "text": "* 1.5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "hub",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      670,
      100,
      22
     ],
     "text": "t l l",
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
     "id": "paint",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      730,
      60,
      22
     ],
     "text": "zl reg",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "clock",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      700,
      80,
      22
     ],
     "text": "qmetro 250",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "clock1",
     "maxclass": "message",
     "patching_rect": [
      910,
      670,
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
     "id": "chg",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      760,
      80,
      22
     ],
     "text": "zl change",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "pset",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      790,
      100,
      22
     ],
     "text": "prepend setlist",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "metah",
     "maxclass": "comment",
     "patching_rect": [
      700,
      400,
      200,
      22
     ],
     "text": "mapping",
     "presentation": 1,
     "presentation_rect": [
      30,
      404,
      300,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 15.0
    }
   },
   {
    "box": {
     "id": "sprl",
     "maxclass": "comment",
     "patching_rect": [
      1000,
      450,
      80,
      20
     ],
     "text": "spread",
     "presentation": 1,
     "presentation_rect": [
      30,
      434,
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
     "id": "sprs",
     "maxclass": "slider",
     "patching_rect": [
      1000,
      475,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      34,
      458,
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
     "id": "sprx",
     "maxclass": "newobj",
     "patching_rect": [
      1000,
      505,
      160,
      22
     ],
     "text": "expr 0.5*pow(9.0,$f1)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sprps",
     "maxclass": "newobj",
     "patching_rect": [
      1070,
      535,
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
     "id": "sprn",
     "maxclass": "flonum",
     "patching_rect": [
      1000,
      565,
      60,
      22
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      544,
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
     "id": "spru",
     "maxclass": "comment",
     "patching_rect": [
      1065,
      565,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      88,
      546,
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
     "id": "spr0",
     "maxclass": "message",
     "patching_rect": [
      1000,
      420,
      35,
      22
     ],
     "text": "0.5",
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
      1200,
      450,
      80,
      20
     ],
     "text": "smoothing",
     "presentation": 1,
     "presentation_rect": [
      160,
      434,
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
      1200,
      475,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      164,
      458,
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
      1200,
      505,
      160,
      22
     ],
     "text": "expr 15*pow(100.0,$f1)",
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
      1200,
      535,
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
      1270,
      535,
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
      1200,
      565,
      60,
      22
     ],
     "presentation": 1,
     "presentation_rect": [
      160,
      544,
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
      1265,
      565,
      30,
      20
     ],
     "text": "ms",
     "presentation": 1,
     "presentation_rect": [
      218,
      546,
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
      1200,
      420,
      35,
      22
     ],
     "text": "0.5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "sg",
     "maxclass": "newobj",
     "patching_rect": [
      1200,
      640,
      90,
      22
     ],
     "text": "s rave4.glide",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "rave",
     "maxclass": "newobj",
     "patching_rect": [
      40,
      700,
      300,
      22
     ],
     "text": "nn~ sol_ordinario decode",
     "presentation": 1,
     "presentation_rect": [
      30,
      590,
      560,
      26
     ],
     "numinlets": 4,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "varname": "rave",
     "fontsize": 14.0
    }
   },
   {
    "box": {
     "id": "vol",
     "maxclass": "gain~",
     "patching_rect": [
      40,
      740,
      200,
      26
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      634,
      220,
      26
     ],
     "varname": "vol",
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
      250,
      745,
      80,
      20
     ],
     "text": "volume",
     "presentation": 1,
     "presentation_rect": [
      258,
      637,
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
      40,
      785,
      45,
      45
     ],
     "presentation": 1,
     "presentation_rect": [
      545,
      624,
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
      95,
      800,
      60,
      20
     ],
     "text": "sound",
     "presentation": 1,
     "presentation_rect": [
      492,
      637,
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
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "info",
      0
     ],
     "destination": [
      "infoc",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "menu",
      0
     ],
     "destination": [
      "mdl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mdl",
      0
     ],
     "destination": [
      "tp",
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
      "m0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m0",
      0
     ],
     "destination": [
      "menu",
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
      "v0",
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
      "dl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dl",
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
   },
   {
    "patchline": {
     "source": [
      "data",
      0
     ],
     "destination": [
      "td",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "td",
      0
     ],
     "destination": [
      "ureg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ru",
      0
     ],
     "destination": [
      "ureg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ureg",
      0
     ],
     "destination": [
      "usel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "usel",
      1
     ],
     "destination": [
      "ulaunch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "bars_r",
      0
     ],
     "destination": [
      "bars",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tatt",
      2
     ],
     "destination": [
      "sc0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sc0",
      0
     ],
     "destination": [
      "cl0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "cl0",
      0
     ],
     "destination": [
      "sp0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sp0",
      0
     ],
     "destination": [
      "pak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tatt",
      3
     ],
     "destination": [
      "sc1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sc1",
      0
     ],
     "destination": [
      "cl1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "cl1",
      0
     ],
     "destination": [
      "sp1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sp1",
      0
     ],
     "destination": [
      "pak",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tgyr",
      5
     ],
     "destination": [
      "sc2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sc2",
      0
     ],
     "destination": [
      "cl2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "cl2",
      0
     ],
     "destination": [
      "sp2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sp2",
      0
     ],
     "destination": [
      "pak",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tacc",
      5
     ],
     "destination": [
      "sc3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sc3",
      0
     ],
     "destination": [
      "cl3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "cl3",
      0
     ],
     "destination": [
      "sp3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sp3",
      0
     ],
     "destination": [
      "pak",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pak",
      0
     ],
     "destination": [
      "hub",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "hub",
      1
     ],
     "destination": [
      "smooth",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "hub",
      0
     ],
     "destination": [
      "paint",
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
      "clock1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "clock1",
      0
     ],
     "destination": [
      "clock",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "clock",
      0
     ],
     "destination": [
      "paint",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "paint",
      0
     ],
     "destination": [
      "chg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "chg",
      0
     ],
     "destination": [
      "pset",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pset",
      0
     ],
     "destination": [
      "bars",
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
      "spr0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "spr0",
      0
     ],
     "destination": [
      "sprs",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sprs",
      0
     ],
     "destination": [
      "sprx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sprx",
      0
     ],
     "destination": [
      "sprps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sprps",
      0
     ],
     "destination": [
      "sprn",
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
      "sprx",
      0
     ],
     "destination": [
      "sp0",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sprx",
      0
     ],
     "destination": [
      "sp1",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sprx",
      0
     ],
     "destination": [
      "sp2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sprx",
      0
     ],
     "destination": [
      "sp3",
      1
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
      "sg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smooth",
      0
     ],
     "destination": [
      "rave",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smooth",
      1
     ],
     "destination": [
      "rave",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smooth",
      2
     ],
     "destination": [
      "rave",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "smooth",
      3
     ],
     "destination": [
      "rave",
      3
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
      "rave",
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
      "vol",
      0
     ],
     "destination": [
      "dac",
      1
     ]
    }
   }
  ],
  "openinpresentation": 1
 }
}