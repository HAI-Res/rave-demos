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
   640,
   674
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
     "text": "RAVE 2 \u00b7 capture and return",
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
     "text": "r rave2.info",
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
     "text": "r rave2.what",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_ordinario decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 4; rave2.bars size 4; rave2.bars 0 0 0 0; rave2.info set 4 dimensions; rave2.what set trained on orchestral instruments \u00b7 ordinary playing (IRCAM SOL); rave2.url symbol https://zenodo.org/records/3685331",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_ordinario_fast decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 8; rave2.bars size 8; rave2.bars 0 0 0 0 0 0 0 0; rave2.info set 8 dimensions; rave2.what set trained on the same sounds \u00b7 a smaller faster model; rave2.url symbol https://zenodo.org/records/3685331",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_full decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 8; rave2.bars size 8; rave2.bars 0 0 0 0 0 0 0 0; rave2.info set 8 dimensions; rave2.what set trained on orchestral instruments \u00b7 every playing technique (IRCAM SOL); rave2.url symbol https://zenodo.org/records/3685331",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ isis decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 8; rave2.bars size 8; rave2.bars 0 0 0 0 0 0 0 0; rave2.info set 8 dimensions; rave2.what set trained on three singers recorded for IRCAM's ISiS synthesizer; rave2.url symbol https://isis-documentation.readthedocs.io/en/latest/voice_installation.html",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ VCTK decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 8; rave2.bars size 8; rave2.bars 0 0 0 0 0 0 0 0; rave2.info set 8 dimensions; rave2.what set trained on speech \u00b7 110 English speakers reading aloud; rave2.url symbol https://huggingface.co/datasets/CSTR-Edinburgh/vctk",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ nasa decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 8; rave2.bars size 8; rave2.bars 0 0 0 0 0 0 0 0; rave2.info set 8 dimensions; rave2.what set trained on radio from the Apollo 11 mission; rave2.url symbol https://www.youtube.com/watch?v=DejhGSEu8wk",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ percussion decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 4; rave2.bars size 4; rave2.bars 0 0 0 0; rave2.info set 4 dimensions; rave2.what set trained on 8 hours of percussion (never published); rave2.url symbol -",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ musicnet decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect smooth 8 rave 8, script connect smooth 9 rave 9, script connect smooth 10 rave 10, script connect smooth 11 rave 11, script connect smooth 12 rave 12, script connect smooth 13 rave 13, script connect smooth 14 rave 14, script connect smooth 15 rave 15, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 16; rave2.bars size 16; rave2.bars 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; rave2.info set 16 dimensions; rave2.what set trained on 330 classical recordings (MusicNet); rave2.url symbol https://zenodo.org/records/5120004",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ vintage decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect smooth 8 rave 8, script connect smooth 9 rave 9, script connect smooth 10 rave 10, script connect smooth 11 rave 11, script connect smooth 12 rave 12, script connect smooth 13 rave 13, script connect smooth 14 rave 14, script connect smooth 15 rave 15, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 560 560 26",
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
         "text": "; rave2.n 16; rave2.bars size 16; rave2.bars 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; rave2.info set 16 dimensions; rave2.what set trained on 80 hours of vintage music (never published); rave2.url symbol -",
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
     "text": "r rave2.url",
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
     "text": "r rave2.bars",
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
     "thickness": 2
    }
   },
   {
    "box": {
     "id": "zero",
     "maxclass": "textbutton",
     "patching_rect": [
      600,
      280,
      70,
      24
     ],
     "text": "zero",
     "presentation": 1,
     "presentation_rect": [
      30,
      370,
      70,
      24
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
     "id": "rnd",
     "maxclass": "textbutton",
     "patching_rect": [
      600,
      310,
      70,
      24
     ],
     "text": "random",
     "presentation": 1,
     "presentation_rect": [
      110,
      370,
      80,
      24
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
     "id": "zl",
     "maxclass": "message",
     "patching_rect": [
      680,
      280,
      140,
      22
     ],
     "text": "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "rp",
     "maxclass": "newobj",
     "patching_rect": [
      680,
      310,
      70,
      22
     ],
     "text": "p random",
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
       120,
       120,
       500,
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
          "bang"
         ]
        }
       },
       {
        "box": {
         "id": "un",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          55,
          60,
          22
         ],
         "text": "uzi 16",
         "numinlets": 2,
         "numoutlets": 3,
         "outlettype": [
          "",
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "tr",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          90,
          60,
          22
         ],
         "text": "t b b b",
         "numinlets": 1,
         "numoutlets": 3,
         "outlettype": [
          "",
          "",
          ""
         ]
        }
       },
       {
        "box": {
         "id": "r0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          125,
          80,
          22
         ],
         "text": "random 1001",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "r1",
         "maxclass": "newobj",
         "patching_rect": [
          110,
          125,
          80,
          22
         ],
         "text": "random 1001",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "r2",
         "maxclass": "newobj",
         "patching_rect": [
          200,
          125,
          80,
          22
         ],
         "text": "random 1001",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "ex",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          165,
          200,
          22
         ],
         "text": "expr ($i1+$i2+$i3-1500)/250.",
         "numinlets": 3,
         "numoutlets": 1,
         "outlettype": [
          ""
         ]
        }
       },
       {
        "box": {
         "id": "tl",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          200,
          90,
          22
         ],
         "text": "zl group 16",
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
         "id": "out",
         "maxclass": "outlet",
         "patching_rect": [
          20,
          240,
          30,
          22
         ],
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
          "un",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "un",
          0
         ],
         "destination": [
          "tr",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tr",
          2
         ],
         "destination": [
          "r2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tr",
          1
         ],
         "destination": [
          "r1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tr",
          0
         ],
         "destination": [
          "r0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "r2",
          0
         ],
         "destination": [
          "ex",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "r1",
          0
         ],
         "destination": [
          "ex",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "r0",
          0
         ],
         "destination": [
          "ex",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "ex",
          0
         ],
         "destination": [
          "tl",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tl",
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
     "id": "tz",
     "maxclass": "newobj",
     "patching_rect": [
      600,
      340,
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
     "id": "trn",
     "maxclass": "newobj",
     "patching_rect": [
      640,
      340,
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
     "id": "cut",
     "maxclass": "newobj",
     "patching_rect": [
      680,
      370,
      80,
      22
     ],
     "text": "zl slice 4",
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
     "id": "rn",
     "maxclass": "newobj",
     "patching_rect": [
      770,
      340,
      70,
      22
     ],
     "text": "r rave2.n",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
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
         "text": "r rave2.glide",
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
     "id": "slots",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      420,
      80,
      22
     ],
     "text": "js slots.js",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "capt",
     "maxclass": "toggle",
     "patching_rect": [
      700,
      380,
      26,
      26
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      424,
      26,
      26
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "captl",
     "maxclass": "comment",
     "patching_rect": [
      730,
      382,
      60,
      20
     ],
     "text": "capture",
     "presentation": 1,
     "presentation_rect": [
      62,
      427,
      70,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "pcap",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      450,
      110,
      22
     ],
     "text": "prepend capture",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "srt",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      450,
      130,
      22
     ],
     "text": "route 1 2 3 4 5 6",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
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
     "id": "slot1",
     "maxclass": "textbutton",
     "patching_rect": [
      820,
      380,
      44,
      26
     ],
     "text": "1",
     "presentation": 1,
     "presentation_rect": [
      150,
      424,
      42,
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
     "id": "st1",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      410,
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
     "id": "sn1",
     "maxclass": "message",
     "patching_rect": [
      820,
      450,
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
     "id": "slot2",
     "maxclass": "textbutton",
     "patching_rect": [
      870,
      380,
      44,
      26
     ],
     "text": "2",
     "presentation": 1,
     "presentation_rect": [
      198,
      424,
      42,
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
     "id": "st2",
     "maxclass": "newobj",
     "patching_rect": [
      870,
      410,
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
     "id": "sn2",
     "maxclass": "message",
     "patching_rect": [
      870,
      450,
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
     "id": "slot3",
     "maxclass": "textbutton",
     "patching_rect": [
      920,
      380,
      44,
      26
     ],
     "text": "3",
     "presentation": 1,
     "presentation_rect": [
      246,
      424,
      42,
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
     "id": "st3",
     "maxclass": "newobj",
     "patching_rect": [
      920,
      410,
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
     "id": "sn3",
     "maxclass": "message",
     "patching_rect": [
      920,
      450,
      30,
      22
     ],
     "text": "3",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "slot4",
     "maxclass": "textbutton",
     "patching_rect": [
      970,
      380,
      44,
      26
     ],
     "text": "4",
     "presentation": 1,
     "presentation_rect": [
      294,
      424,
      42,
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
     "id": "st4",
     "maxclass": "newobj",
     "patching_rect": [
      970,
      410,
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
     "id": "sn4",
     "maxclass": "message",
     "patching_rect": [
      970,
      450,
      30,
      22
     ],
     "text": "4",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "slot5",
     "maxclass": "textbutton",
     "patching_rect": [
      1020,
      380,
      44,
      26
     ],
     "text": "5",
     "presentation": 1,
     "presentation_rect": [
      342,
      424,
      42,
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
     "id": "st5",
     "maxclass": "newobj",
     "patching_rect": [
      1020,
      410,
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
     "id": "sn5",
     "maxclass": "message",
     "patching_rect": [
      1020,
      450,
      30,
      22
     ],
     "text": "5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "slot6",
     "maxclass": "textbutton",
     "patching_rect": [
      1070,
      380,
      44,
      26
     ],
     "text": "6",
     "presentation": 1,
     "presentation_rect": [
      390,
      424,
      42,
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
     "id": "st6",
     "maxclass": "newobj",
     "patching_rect": [
      1070,
      410,
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
     "id": "sn6",
     "maxclass": "message",
     "patching_rect": [
      1070,
      450,
      30,
      22
     ],
     "text": "6",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "rnc",
     "maxclass": "newobj",
     "patching_rect": [
      960,
      420,
      70,
      22
     ],
     "text": "r rave2.n",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "clr",
     "maxclass": "message",
     "patching_rect": [
      960,
      450,
      45,
      22
     ],
     "text": "clear",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "gll",
     "maxclass": "comment",
     "patching_rect": [
      1100,
      380,
      60,
      20
     ],
     "text": "glide",
     "presentation": 1,
     "presentation_rect": [
      470,
      400,
      60,
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
     "id": "gls",
     "maxclass": "slider",
     "patching_rect": [
      1100,
      405,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      474,
      424,
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
     "id": "glx",
     "maxclass": "newobj",
     "patching_rect": [
      1100,
      490,
      140,
      22
     ],
     "text": "expr 30*pow(100.,$f1)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "glr",
     "maxclass": "newobj",
     "patching_rect": [
      1100,
      520,
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
     "id": "glp",
     "maxclass": "newobj",
     "patching_rect": [
      1170,
      520,
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
     "id": "gln",
     "maxclass": "number",
     "patching_rect": [
      1100,
      550,
      56,
      24
     ],
     "presentation": 1,
     "presentation_rect": [
      470,
      510,
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
     "id": "glu",
     "maxclass": "comment",
     "patching_rect": [
      1160,
      550,
      30,
      20
     ],
     "text": "ms",
     "presentation": 1,
     "presentation_rect": [
      528,
      512,
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
     "id": "gsend",
     "maxclass": "newobj",
     "patching_rect": [
      1170,
      580,
      90,
      22
     ],
     "text": "s rave2.glide",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "gl0",
     "maxclass": "message",
     "patching_rect": [
      1100,
      350,
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
      560,
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
      604,
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
      607,
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
      594,
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
      607,
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
      "zero",
      0
     ],
     "destination": [
      "tz",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tz",
      0
     ],
     "destination": [
      "zl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rnd",
      0
     ],
     "destination": [
      "trn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "trn",
      0
     ],
     "destination": [
      "rp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "zl",
      0
     ],
     "destination": [
      "cut",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rp",
      0
     ],
     "destination": [
      "cut",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rn",
      0
     ],
     "destination": [
      "cut",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "cut",
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
      "bars",
      0
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
      "bars",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "capt",
      0
     ],
     "destination": [
      "pcap",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pcap",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slots",
      2
     ],
     "destination": [
      "capt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slots",
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
      "slots",
      1
     ],
     "destination": [
      "srt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slot1",
      0
     ],
     "destination": [
      "st1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "st1",
      0
     ],
     "destination": [
      "sn1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sn1",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "srt",
      0
     ],
     "destination": [
      "slot1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slot2",
      0
     ],
     "destination": [
      "st2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "st2",
      0
     ],
     "destination": [
      "sn2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sn2",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "srt",
      1
     ],
     "destination": [
      "slot2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slot3",
      0
     ],
     "destination": [
      "st3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "st3",
      0
     ],
     "destination": [
      "sn3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sn3",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "srt",
      2
     ],
     "destination": [
      "slot3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slot4",
      0
     ],
     "destination": [
      "st4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "st4",
      0
     ],
     "destination": [
      "sn4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sn4",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "srt",
      3
     ],
     "destination": [
      "slot4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slot5",
      0
     ],
     "destination": [
      "st5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "st5",
      0
     ],
     "destination": [
      "sn5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sn5",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "srt",
      4
     ],
     "destination": [
      "slot5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "slot6",
      0
     ],
     "destination": [
      "st6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "st6",
      0
     ],
     "destination": [
      "sn6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sn6",
      0
     ],
     "destination": [
      "slots",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "srt",
      5
     ],
     "destination": [
      "slot6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rnc",
      0
     ],
     "destination": [
      "clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "clr",
      0
     ],
     "destination": [
      "slots",
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
      "gl0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gl0",
      0
     ],
     "destination": [
      "gls",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gls",
      0
     ],
     "destination": [
      "glx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "glx",
      0
     ],
     "destination": [
      "glr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "glr",
      0
     ],
     "destination": [
      "glp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "glp",
      0
     ],
     "destination": [
      "gln",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "glr",
      0
     ],
     "destination": [
      "gsend",
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