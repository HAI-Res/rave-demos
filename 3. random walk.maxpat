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
   714
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
     "text": "RAVE 3 \u00b7 a random walk",
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
     "text": "r rave3.info",
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
     "text": "r rave3.what",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_ordinario decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 4; rave3.bars size 4; rave3.bars 0 0 0 0; rave3.info set 4 dimensions; rave3.what set trained on orchestral instruments \u00b7 ordinary playing (IRCAM SOL); rave3.url symbol https://zenodo.org/records/3685331",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_ordinario_fast decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 8; rave3.bars size 8; rave3.bars 0 0 0 0 0 0 0 0; rave3.info set 8 dimensions; rave3.what set trained on the same sounds \u00b7 a smaller faster model; rave3.url symbol https://zenodo.org/records/3685331",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ sol_full decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 8; rave3.bars size 8; rave3.bars 0 0 0 0 0 0 0 0; rave3.info set 8 dimensions; rave3.what set trained on orchestral instruments \u00b7 every playing technique (IRCAM SOL); rave3.url symbol https://zenodo.org/records/3685331",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ isis decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 8; rave3.bars size 8; rave3.bars 0 0 0 0 0 0 0 0; rave3.info set 8 dimensions; rave3.what set trained on three singers recorded for IRCAM's ISiS synthesizer; rave3.url symbol https://isis-documentation.readthedocs.io/en/latest/voice_installation.html",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ VCTK decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 8; rave3.bars size 8; rave3.bars 0 0 0 0 0 0 0 0; rave3.info set 8 dimensions; rave3.what set trained on speech \u00b7 110 English speakers reading aloud; rave3.url symbol https://huggingface.co/datasets/CSTR-Edinburgh/vctk",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ nasa decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 8; rave3.bars size 8; rave3.bars 0 0 0 0 0 0 0 0; rave3.info set 8 dimensions; rave3.what set trained on radio from the Apollo 11 mission; rave3.url symbol https://www.youtube.com/watch?v=DejhGSEu8wk",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ percussion decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 4; rave3.bars size 4; rave3.bars 0 0 0 0; rave3.info set 4 dimensions; rave3.what set trained on 8 hours of percussion (never published); rave3.url symbol -",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ musicnet decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect smooth 8 rave 8, script connect smooth 9 rave 9, script connect smooth 10 rave 10, script connect smooth 11 rave 11, script connect smooth 12 rave 12, script connect smooth 13 rave 13, script connect smooth 14 rave 14, script connect smooth 15 rave 15, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 16; rave3.bars size 16; rave3.bars 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; rave3.info set 16 dimensions; rave3.what set trained on 330 classical recordings (MusicNet); rave3.url symbol https://zenodo.org/records/5120004",
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
         "text": "script delete rave, script newdefault rave 40 700 nn~ vintage decode, script connect smooth 0 rave 0, script connect smooth 1 rave 1, script connect smooth 2 rave 2, script connect smooth 3 rave 3, script connect smooth 4 rave 4, script connect smooth 5 rave 5, script connect smooth 6 rave 6, script connect smooth 7 rave 7, script connect smooth 8 rave 8, script connect smooth 9 rave 9, script connect smooth 10 rave 10, script connect smooth 11 rave 11, script connect smooth 12 rave 12, script connect smooth 13 rave 13, script connect smooth 14 rave 14, script connect smooth 15 rave 15, script connect rave 0 vol 0, script sendbox rave presentation 1, script sendbox rave presentation_rect 30 600 560 26",
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
         "text": "; rave3.n 16; rave3.bars size 16; rave3.bars 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; rave3.info set 16 dimensions; rave3.what set trained on 80 hours of vintage music (never published); rave3.url symbol -",
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
     "text": "r rave3.url",
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
     "text": "r rave3.bars",
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
     "text": "r rave3.n",
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
         "text": "r rave3.glide",
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
     "id": "hub",
     "maxclass": "newobj",
     "patching_rect": [
      30,
      560,
      560,
      22
     ],
     "text": "t l l l",
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
     "id": "walk",
     "maxclass": "newobj",
     "patching_rect": [
      400,
      520,
      80,
      22
     ],
     "text": "js walk.js",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "paint",
     "maxclass": "newobj",
     "patching_rect": [
      600,
      590,
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
      600,
      560,
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
      690,
      530,
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
      600,
      620,
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
      600,
      650,
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
     "text": "\u201cmetaparameters\u201d",
     "presentation": 1,
     "presentation_rect": [
      30,
      414,
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
     "id": "go",
     "maxclass": "toggle",
     "patching_rect": [
      700,
      450,
      26,
      26
     ],
     "presentation": 1,
     "presentation_rect": [
      30,
      494,
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
     "id": "gol",
     "maxclass": "comment",
     "patching_rect": [
      730,
      452,
      50,
      20
     ],
     "text": "walk",
     "presentation": 1,
     "presentation_rect": [
      62,
      497,
      50,
      20
     ],
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "ssl",
     "maxclass": "comment",
     "patching_rect": [
      820,
      450,
      80,
      20
     ],
     "text": "step size",
     "presentation": 1,
     "presentation_rect": [
      160,
      444,
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
     "id": "sss",
     "maxclass": "slider",
     "patching_rect": [
      820,
      475,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      164,
      468,
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
     "id": "ssx",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      505,
      160,
      22
     ],
     "text": "expr 0.01*pow(100.0,$f1)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "ssps",
     "maxclass": "newobj",
     "patching_rect": [
      890,
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
     "id": "ssn",
     "maxclass": "flonum",
     "patching_rect": [
      820,
      565,
      60,
      22
     ],
     "presentation": 1,
     "presentation_rect": [
      160,
      554,
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
     "id": "ssu",
     "maxclass": "comment",
     "patching_rect": [
      885,
      565,
      30,
      20
     ],
     "text": "",
     "presentation": 1,
     "presentation_rect": [
      218,
      556,
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
     "id": "ss0",
     "maxclass": "message",
     "patching_rect": [
      820,
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
     "id": "msl",
     "maxclass": "comment",
     "patching_rect": [
      1000,
      450,
      80,
      20
     ],
     "text": "step every",
     "presentation": 1,
     "presentation_rect": [
      290,
      444,
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
     "id": "mss",
     "maxclass": "slider",
     "patching_rect": [
      1000,
      475,
      22,
      80
     ],
     "presentation": 1,
     "presentation_rect": [
      294,
      468,
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
     "id": "msx",
     "maxclass": "newobj",
     "patching_rect": [
      1000,
      505,
      160,
      22
     ],
     "text": "expr 20*pow(100.0,$f1)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "msr",
     "maxclass": "newobj",
     "patching_rect": [
      1000,
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
     "id": "msps",
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
     "id": "msn",
     "maxclass": "number",
     "patching_rect": [
      1000,
      565,
      60,
      22
     ],
     "presentation": 1,
     "presentation_rect": [
      290,
      554,
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
     "id": "msu",
     "maxclass": "comment",
     "patching_rect": [
      1065,
      565,
      30,
      20
     ],
     "text": "ms",
     "presentation": 1,
     "presentation_rect": [
      348,
      556,
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
     "id": "ms0",
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
     "id": "pss",
     "maxclass": "newobj",
     "patching_rect": [
      820,
      600,
      110,
      22
     ],
     "text": "prepend stepsize",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "met",
     "maxclass": "newobj",
     "patching_rect": [
      700,
      630,
      80,
      22
     ],
     "text": "metro 200",
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
      1000,
      630,
      90,
      22
     ],
     "text": "s rave3.glide",
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
      600,
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
      644,
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
      647,
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
      634,
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
      647,
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
      "hub",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "walk",
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
      2
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
      1
     ],
     "destination": [
      "walk",
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
      "ss0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ss0",
      0
     ],
     "destination": [
      "sss",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sss",
      0
     ],
     "destination": [
      "ssx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ssx",
      0
     ],
     "destination": [
      "ssps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ssps",
      0
     ],
     "destination": [
      "ssn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msx",
      0
     ],
     "destination": [
      "msr",
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
      "ms0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ms0",
      0
     ],
     "destination": [
      "mss",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mss",
      0
     ],
     "destination": [
      "msx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msr",
      0
     ],
     "destination": [
      "msps",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msps",
      0
     ],
     "destination": [
      "msn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ssx",
      0
     ],
     "destination": [
      "pss",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pss",
      0
     ],
     "destination": [
      "walk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "go",
      0
     ],
     "destination": [
      "met",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msr",
      0
     ],
     "destination": [
      "met",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msr",
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
      "met",
      0
     ],
     "destination": [
      "walk",
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