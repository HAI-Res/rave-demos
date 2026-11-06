# RAVE demos

Max and REAPER demos for class.

**Easiest:** download `rave-demos-everything.zip` (1.9 GB) from
https://github.com/HAI-Res/rave-demos/releases/latest. It is this repo with all
the models already in place.

| folder | what is in it |
| --- | --- |
| `rave/` | RAVE, a neural audio model from IRCAM: four Max patches |
| `the-source/` | THE SOURCE (bioMECI) body signals driving sound, in REAPER and Max. Setup is in its own README |
| `dev/` | how the patches and the bird models were made. You can ignore it |

## RAVE

RAVE turns sound into a short list of numbers and back. These patches let you
change those numbers yourself, save them, let them wander, and move them with
a phone.

### Setup

1. Install Max 8 or 9.
2. Install nn~ from https://github.com/acids-ircam/nn_tilde/releases. Put the
   `nn_tilde` folder in `~/Documents/Max 9/Packages` (or `Max 8`). On Max 8,
   use version 1.5.6. Restart Max.
3. If you cloned the repo instead of downloading the zip, get the 11 models
   (1.9 GB) into `rave/`:

   ```sh
   rave/get-models.sh
   ```

   Nine are IRCAM's. Two (`birds_z16`, `birds_z4`) we trained on birdsong
   from the Macaulay Library.

### Patches

Open the files in `rave/` that start with a number. The other files there are
what the patches need; leave them where they are.

1. **decoder by hand**: drag the bars to change the sound.
2. **capture and return**: save the bars in slots and go back to them.
3. **random walk**: the bars wander on their own.
4. **phone to rave**: your phone moves the bars. Scan the code with your
   phone's camera. Needs internet.

Each bar is one number the model reads. 0 is the middle. Pick a model from
the menu. Models have 4, 8 or 16 bars. **training data** opens the sounds the
model learned from. `rave/how RAVE works.html` explains the model; open it in
a browser.

## Credits

RAVE: Antoine Caillon and Philippe Esling, IRCAM. nn~ and the models: IRCAM
ACIDS. Patch 4 is based on Sarah Nabi's embodied latent exploration,
https://github.com/ircam-ismm/embodied-latent-exploration.
