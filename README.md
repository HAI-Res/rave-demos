# RAVE demos

Max patches for playing RAVE, a neural audio model from IRCAM.

RAVE turns sound into a short list of numbers and back. These patches let you
change those numbers yourself, save them, let them wander, and move them with
a phone.

## Setup

1. Install Max 8 or 9.
2. Install nn~ from https://github.com/acids-ircam/nn_tilde/releases. Put the
   `nn_tilde` folder in `~/Documents/Max 9/Packages` (or `Max 8`). On Max 8,
   use version 1.5.6. Restart Max.
3. Download the models (1.6 GB) into this folder:

   ```sh
   ./get-models.sh
   ```

   The bird models (`birds_z16`, `birds_z4`) are not in that download. We
   trained them on birdsong from the Macaulay Library; they play from the
   instructor's laptop.

## Patches

1. **decoder by hand**: drag the bars to change the sound.
2. **capture and return**: save the bars in slots and go back to them.
3. **random walk**: the bars wander on their own.
4. **phone to rave**: your phone moves the bars. Scan the code with your
   phone's camera. Needs internet.

Each bar is one number the model reads. 0 is the middle. Pick a model from
the menu. Models have 4, 8 or 16 bars. **training data** opens the sounds the
model learned from.

## Files

| file | what it is |
| --- | --- |
| `1.` to `4.` | the patches |
| `how RAVE works.html` | how the model works, open in a browser |
| `get-models.sh` | downloads the models |
| `walk.js`, `slots.js` | the random walk and the slots |
| `ap.*`, other `.js`, `vendor/` | receive the phone's data |
| `tools/gen_patches.py` | writes patches 1 to 4 |
| `the-source/` | THE SOURCE (bioMECI) driving noise, in REAPER and Max |
| `train/` | how the bird models were trained (CSAIL cluster jobs) |

## Credits

RAVE: Antoine Caillon and Philippe Esling, IRCAM. nn~ and the models: IRCAM
ACIDS. Patch 4 is based on Sarah Nabi's embodied latent exploration,
https://github.com/ircam-ismm/embodied-latent-exploration.
