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

## Setup: install THE SOURCE

Pick one of these. Both put the app and the VST3 plugin on your computer.

### bioMECI's builds (Mac, Windows, Linux)

In `official/`:

| system | file | install |
| --- | --- | --- |
| Mac | `THE_SOURCE_0.9.2_Mac.dmg.zip` | unzip, open the `.dmg`, follow its steps |
| Windows | `THE_SOURCE_0.9.0_Windows_x64.zip` | unzip, run the `Setup.exe` |
| Linux, Ubuntu or Debian | `THE_SOURCE_0.9.0_amd64.zip` | unzip, then `sudo apt install ./THE_SOURCE_0.9.0_amd64.deb` |
| Linux, any | `THE_SOURCE_0.9.0_Linux_x86_64.tar.gz` | unpack, then follow its `README.txt`: the plugin goes in `~/.vst3/` |

These update their visuals at full speed.

### 4 Hz version (Mac with Apple Silicon only)

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

`4hz-patch/patch.py` makes the same change to a fresh install of version 0.9.0
only. It refuses to run on any other version, including the 0.9.2 Mac build in
`official/`.

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

### 3. Add the two effects

Copy `source-noise.jsfx` and `source-osc.jsfx` into REAPER's Effects folder. To find it in REAPER:
Options, Show REAPER resource path, then open `Effects`. The folder is usually:

| system | folder |
| --- | --- |
| macOS | `~/Library/Application Support/REAPER/Effects` |
| Windows | `%APPDATA%\REAPER\Effects` |
| Linux | `~/.config/REAPER/Effects` |

### 4. Choose THE SOURCE as REAPER's audio input

Plug in the device. THE SOURCE is also a USB audio interface: the body signals
arrive on its 2 inputs. In REAPER: Preferences, Audio, Device. Set the input
device to **THE SOURCE** and keep your usual output. Track 1 takes inputs 1+2.
It is armed with monitoring on so the signal reaches the plugin; it is set to
record nothing.

### 5. Open the session

Open `the-source-noise.RPP`.

| track | what it does |
| --- | --- |
| 1 THE SOURCE | the plugin. Its fader is down on purpose: its outputs are raw values, not sound |
| 2 noise | one channel drives the loudness of noise |
| 3 oscillator | one channel drives the loudness of an oscillator. Mix sine, triangle, saw and square. Muted at first |

To swap, mute track 2 and unmute track 3. Open a track's FX window to choose
the signal. Cooked ECG is the default. Without the device connected, only BPM,
R2R and Valence move.

To check you have the 4 Hz version: open THE SOURCE's window on track 1. Its
graphs should update about 4 times a second, not smoothly.

## Max

Open `the source to noise.maxpat`. It loads THE SOURCE in `vst~`. **sound**
switches between the noise and the oscillator. In both, the signal drives the
loudness. If you
installed or replaced the plugin while Max was open, restart Max. In Options,
Audio Status, set the input device to **THE SOURCE**: the body signals arrive
on its 2 inputs. Choose the
signal from the menu and switch the sound on.

## Controls (both versions)

The signal drives the loudness of the sound.

- **signal**: which channel drives it.
- **depth**: how much the signal changes the loudness.
- **smoothing**: how quickly the sound follows the signal.
- **frequency**, **sin**, **tri**, **saw**, **sqr** (oscillator): its pitch and
  the mix of its four waves.

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
