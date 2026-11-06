# RAVE demos

Playing a neural audio model by hand, then with a phone.

RAVE (IRCAM) is an autoencoder for sound: an **encoder** turns audio into a
few numbers per moment, and a **decoder** turns those numbers back into audio
in the voice of whatever it was trained on — orchestral instruments, speech,
percussion. These patches skip the encoder and let you set the numbers
yourself.

`how RAVE works.html` explains the model, what each patch is showing, and
BRAVE, a newer low-latency version. Open it in a browser.

## Setup (once)

1. **Max 8 or 9.**
2. **nn~**, IRCAM's external that runs RAVE models in Max:
   download it from <https://github.com/acids-ircam/nn_tilde/releases> and put
   the `nn_tilde` folder in `~/Documents/Max 9/Packages` (or `Max 8`). On
   Max 8, use **v1.5.6**: v1.6.0 needs Max 9. Restart Max.
3. **The models**, about 1.6 GB, into this folder:

   ```sh
   ./get-models.sh
   ```

   They come from IRCAM's public model server. Max finds them by name
   because they sit next to the patches.

## The patches

### 1. decoder by hand

Choose a model, switch the sound on, drag the bars. Each bar is one number
the decoder reads, called a latent dimension. Different models have different
numbers of bars: 4, 8 or 16. The middle line is 0, the typical sound; the top
and bottom are ±3, the edge of what the model learned. Bars on the left
matter most. **training data ↗** opens the page for the sound the model was
trained on, where it is public.

Things to try:

- On **percussion**, pull the first bar below zero. The sound almost
  disappears, whatever the others do. Nobody designed that bar to be volume.
  Loud-versus-silent was simply the biggest difference in the training audio.
- Compare **sol_ordinario** and **sol_ordinario_fast**. Same sounds, but the
  fast one hears a new set of numbers 86 times a second instead of 21.5.
- Press **random** a few times on **VCTK** (speech) and **musicnet**
  (classical recordings).

### 2. capture and return

Tick **capture**, then click a slot (1–6) to keep the bars as they are.
Click a filled slot to go back to it. **glide** sets how long the sound
takes to travel there, from 30 ms to 3 s, so slots can also be used to morph
between sounds. Changing the model empties the slots.

### 3. random walk

The same bars, moved by a random walk: every step, each dimension moves a
random amount. Two "metaparameters" shape the walk (they are settings of the
walk, not of the model):

- **step size**: how far a typical step goes, in the same units as the bars
  (0.01 to 1).
- **step every**: how often it steps (20 to 2000 ms).

Both sliders are logarithmic. We hear rates and sizes as ratios, so moving a
slider the same distance anywhere along it doubles (or halves) the value.

Small steps taken often drift slowly through nearby sounds; big steps jump
around. Drag a bar while it walks and the walk carries on from there. The bars
repaint at most 4 times a second, while the decoder hears every step.

### 4. phone to rave

The phone's motion replaces the bars. Tilt forward and back, and side to side,
for the first two dimensions; spin for the third; shake for the fourth.

Scan the code in the patch with your phone's camera. It opens a web page.
Type a name and tap **Start**. Your phone's data then goes to your laptop only.
Max needs internet for this.

## Credits

RAVE: Antoine Caillon and Philippe Esling, IRCAM. nn~ and the pretrained
models: IRCAM ACIDS team. The phone mapping is a simplification of Sarah
Nabi's "direct motion exploration" (MOCO 2024,
<https://github.com/ircam-ismm/embodied-latent-exploration>). BRAVE: Franco
Caspe et al., 2025, <https://fcaspe.github.io/brave>.
