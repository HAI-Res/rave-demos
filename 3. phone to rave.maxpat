{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 5,
   "revision": 7,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60,
   40,
   1020,
   860
  ],
  "default_fontsize": 12.0,
  "default_fontname": "Arial",
  "gridsize": [
   15,
   15
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "patching_rect": [
      20,
      10,
      900,
      26
     ],
     "text": "Phone \u2192 RAVE: move the phone, move through a model's latent space",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 16.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "patching_rect": [
      20,
      36,
      900,
      20
     ],
     "text": "Sarah Nabi's \"direct motion exploration\" (IRCAM, MOCO '24), stripped down: four motions drive the first four latent dimensions of a RAVE decoder.",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "comment",
     "patching_rect": [
      20,
      70,
      300,
      22
     ],
     "text": "1  Connect a phone",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 16.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "bpatcher",
     "patching_rect": [
      20,
      95,
      208,
      126
     ],
     "name": "ap.receive.maxpat",
     "numoutlets": 0,
     "outlettype": [],
     "numinlets": 0,
     "embed": 0,
     "viewvisibility": 1,
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
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
     "id": "obj-5",
     "maxclass": "bpatcher",
     "patching_rect": [
      250,
      95,
      258,
      312
     ],
     "name": "ap.qr.maxpat",
     "numoutlets": 0,
     "outlettype": [],
     "numinlets": 0,
     "embed": 0,
     "viewvisibility": 1,
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
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
     "id": "obj-6",
     "maxclass": "comment",
     "patching_rect": [
      530,
      95,
      380,
      60
     ],
     "text": "Set the QR menu to \"app\" and scan it with Ductus.\nIn Ductus, turn on Gyroscope, Attitude and Accelerometer.\nSame Wi-Fi as this laptop.",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "patching_rect": [
      20,
      430,
      240,
      22
     ],
     "text": "2  Motion \u2192 latent",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 16.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "comment",
     "patching_rect": [
      220,
      434,
      700,
      20
     ],
     "text": "rave.latent's arguments: the motion's range. Spin and shake are never negative, so their range is centred on 0: still = middle of the latent space",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "bpatcher",
     "patching_rect": [
      20,
      460,
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
     "embed": 0,
     "viewvisibility": 1,
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
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
     "id": "obj-10",
     "maxclass": "bpatcher",
     "patching_rect": [
      300,
      460,
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
     "embed": 0,
     "viewvisibility": 1,
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
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
     "id": "obj-11",
     "maxclass": "bpatcher",
     "patching_rect": [
      600,
      460,
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
     "embed": 0,
     "viewvisibility": 1,
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
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
     "id": "obj-12",
     "maxclass": "comment",
     "patching_rect": [
      20,
      510,
      180,
      20
     ],
     "text": "z1 \u00b7 tilt toward/away (\u00b0)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "patching_rect": [
      20,
      532,
      150,
      22
     ],
     "text": "rave.latent -90. 90.",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ]
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "comment",
     "patching_rect": [
      210,
      510,
      180,
      20
     ],
     "text": "z2 \u00b7 tilt left/right (\u00b0)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "patching_rect": [
      210,
      532,
      150,
      22
     ],
     "text": "rave.latent -90. 90.",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ]
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "comment",
     "patching_rect": [
      400,
      510,
      180,
      20
     ],
     "text": "z3 \u00b7 spin (rad/s)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "patching_rect": [
      400,
      532,
      150,
      22
     ],
     "text": "rave.latent -8. 8.",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ]
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "comment",
     "patching_rect": [
      590,
      510,
      180,
      20
     ],
     "text": "z4 \u00b7 shake (m/s\u00b2)",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "patching_rect": [
      590,
      532,
      150,
      22
     ],
     "text": "rave.latent -15. 15.",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ]
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "comment",
     "patching_rect": [
      800,
      510,
      90,
      20
     ],
     "text": "spread \u00b1",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "flonum",
     "patching_rect": [
      800,
      532,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 0,
     "format": 6,
     "minimum": 0.0,
     "maximum": 5.0
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "patching_rect": [
      800,
      560,
      90,
      22
     ],
     "text": "s rave.spread",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "comment",
     "patching_rect": [
      900,
      510,
      120,
      20
     ],
     "text": "smoothing ms",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "flonum",
     "patching_rect": [
      900,
      532,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 0,
     "format": 6,
     "minimum": 0.0
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "newobj",
     "patching_rect": [
      900,
      560,
      95,
      22
     ],
     "text": "s rave.smooth",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "newobj",
     "patching_rect": [
      865,
      532,
      30,
      22
     ],
     "text": "loadmess 2.",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "newobj",
     "patching_rect": [
      965,
      532,
      30,
      22
     ],
     "text": "loadmess 60",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "comment",
     "patching_rect": [
      800,
      620,
      300,
      22
     ],
     "text": "3  Sound",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 16.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "comment",
     "patching_rect": [
      800,
      646,
      160,
      20
     ],
     "text": "model",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "umenu",
     "patching_rect": [
      800,
      666,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": [
      "percussion",
      ",",
      "vintage",
      ",",
      "VCTK",
      ",",
      "nasa",
      ",",
      "musicnet",
      ",",
      "isis",
      ",",
      "sol_ordinario",
      ",",
      "sol_full",
      ",",
      "sol_ordinario_fast"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "newobj",
     "patching_rect": [
      925,
      666,
      30,
      22
     ],
     "text": "loadmess set 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "comment",
     "patching_rect": [
      940,
      646,
      100,
      20
     ],
     "text": "volume 0 \u2026 1",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "flonum",
     "patching_rect": [
      950,
      666,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 0,
     "format": 6,
     "minimum": 0.0,
     "maximum": 1.0
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "newobj",
     "patching_rect": [
      1015,
      666,
      30,
      22
     ],
     "text": "loadmess 0.3",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "patching_rect": [
      20,
      720,
      950,
      22
     ],
     "text": "rave.voice percussion",
     "numinlets": 6,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "ezdac~",
     "patching_rect": [
      20,
      760,
      45,
      45
     ],
     "numinlets": 2,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "comment",
     "patching_rect": [
      75,
      772,
      300,
      20
     ],
     "text": "\u2190 click to turn audio on",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "comment",
     "patching_rect": [
      800,
      760,
      200,
      20
     ],
     "text": "z1 \u2026 z4 now",
     "numinlets": 1,
     "numoutlets": 0
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "newobj",
     "patching_rect": [
      950,
      760,
      80,
      22
     ],
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "message",
     "patching_rect": [
      800,
      782,
      170,
      22
     ],
     "text": "",
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
      "obj-9",
      2
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      3
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10",
      5
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      5
     ],
     "destination": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
      0
     ],
     "destination": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-25",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-31",
      0
     ],
     "destination": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      0
     ],
     "destination": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      0
     ],
     "destination": [
      "obj-35",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-17",
      0
     ],
     "destination": [
      "obj-35",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      0
     ],
     "destination": [
      "obj-35",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      1
     ],
     "destination": [
      "obj-35",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      0
     ],
     "destination": [
      "obj-35",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-36",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      1
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   }
  ]
 }
}