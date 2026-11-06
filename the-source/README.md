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

### THE SOURCE, 4 Hz version (Mac with Apple Silicon)

`4hz/` holds THE SOURCE v0.9.0, app and VST3, with its visuals slowed to 4
updates a second. It runs only on Macs with Apple Silicon (M1 or later).

1. Unzip both files.
2. Move `THE SOURCE.app` to `/Applications`, replacing any copy already there.
3. Move `THE SOURCE.vst3` to `/Library/Audio/Plug-Ins/VST3`, replacing any copy
   already there. Finder asks for your password.
4. Check there is no other `THE SOURCE.vst3` in `~/Library/Audio/Plug-Ins/VST3`.
   If there is, delete it. Two copies means REAPER or Max may load the wrong one.
5. In Terminal, let macOS open them (they are not signed by Apple):

   ```sh
   xattr -dr com.apple.quarantine "/Applications/THE SOURCE.app" "/Library/Audio/Plug-Ins/VST3/THE SOURCE.vst3"
   ```

To patch a copy you installed from bioMECI instead, see `4hz-patch/`.

### THE SOURCE on Windows or Linux

The 4 Hz version is Mac only. Install THE SOURCE from bioMECI if they offer it
for your system. Its visuals will update at full speed.

## REAPER

### 1. Install REAPER

Download it from https://www.reaper.fm/download.php. There are versions for
macOS, Windows and Linux. The full program is free to try for 60 days.

### 2. Make REAPER find the plugin

REAPER looks for VST3 plugins here:

| system | folder |
| --- | --- |
| macOS | `/Library/Audio/Plug-Ins/VST3` |
| Windows | `C:\Program Files\Common Files\VST3` |
| Linux | `~/.vst3` |

If REAPER was open while you installed or replaced the plugin: Preferences,
Plug-ins, VST, then click **Clear cache/re-scan**. REAPER keeps a list of the
plugins it found, and this makes it look again.

### 3. Add the noise effect

Copy `source-noise.jsfx` into REAPER's Effects folder. To find it in REAPER:
Options, Show REAPER resource path, then open `Effects`. The folder is usually:

| system | folder |
| --- | --- |
| macOS | `~/Library/Application Support/REAPER/Effects` |
| Windows | `%APPDATA%\REAPER\Effects` |
| Linux | `~/.config/REAPER/Effects` |

### 4. Open the session

Open `the-source-noise.RPP`. Track 1 holds THE SOURCE. Track 2 receives its 12
channels and runs `source-noise`. Open track 2's FX window to choose the
signal.

To check you have the 4 Hz version: open THE SOURCE's window on track 1. Its
graphs should update about 4 times a second, not smoothly.

## Max

Open `the source to noise.maxpat`. It loads THE SOURCE in `vst~`. If you
installed or replaced the plugin while Max was open, restart Max. Choose the
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
