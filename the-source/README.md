# THE SOURCE demos

THE SOURCE (bioMECI) reads body signals: heart, breath, touch. Its plugin
outputs them as 12 audio channels. These demos use one of those channels to
drive noise, in REAPER or in Max.

| channel | signal |
| --- | --- |
| 1 | Raw ECG |
| 2 | Cooked ECG |
| 3 | BPM |
| 4 | R2R |
| 5 | Valence |
| 6 | Arousal |
| 7 | RSP |
| 8 | RSP Rate |
| 9 | RSP Effort |
| 10 | Touch Plate |
| 11, 12 | unused |

## Setup

`4hz/` holds THE SOURCE v0.9.0, app and VST3, with its visuals slowed to 4
updates a second. To install:

1. Unzip both files.
2. Move `THE SOURCE.app` to `/Applications`.
3. Move `THE SOURCE.vst3` to `~/Library/Audio/Plug-Ins/VST3`.
4. In Terminal, let macOS open them (they are not signed by Apple):

   ```sh
   xattr -dr com.apple.quarantine "/Applications/THE SOURCE.app" ~/Library/Audio/Plug-Ins/VST3/"THE SOURCE.vst3"
   ```

To patch a copy you installed from bioMECI instead, see `4hz-patch/`.

## REAPER

1. Download REAPER from https://www.reaper.fm/download.php and install it. The
   full version is free to try for 60 days.
2. Copy `source-noise.jsfx` into REAPER's Effects folder. To find it: Options,
   Show REAPER resource path, then open `Effects`.
3. Open `the-source-noise.RPP`.

Track 1 holds THE SOURCE. Track 2 receives its 12 channels and runs
`source-noise`. Open track 2's FX window to choose the signal.

## Max

Open `the source to noise.maxpat`. It loads THE SOURCE in `vst~`. Choose the
signal from the menu and switch the sound on.

## Controls (both versions)

- **signal**: which channel drives the noise.
- **drives**: loudness, brightness, or both.
- **depth**: how much the signal changes the noise.
- **smoothing**: how quickly the noise follows the signal.

The signal is rescaled to 0 to 1 by tracking its own range over about 10
seconds, so every channel works without setup.

## 4hz-patch

`patch.py` changes three redraw timers in THE SOURCE v0.9.0 from 40 ms to 250
ms. It only works on that version and refuses to run if the bytes differ.

```sh
python3 -I patch.py vst3 "/Library/Audio/Plug-Ins/VST3/THE SOURCE.vst3/Contents/MacOS/THE SOURCE"
codesign --force --sign - "/Library/Audio/Plug-Ins/VST3/THE SOURCE.vst3"
python3 -I patch.py app "/Applications/THE SOURCE.app/Contents/MacOS/THE SOURCE"
codesign --force --sign - "/Applications/THE SOURCE.app"
```

Back up both first. Updating THE SOURCE undoes the patch.
