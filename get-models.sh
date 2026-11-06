#!/bin/sh
# Downloads IRCAM's public pretrained RAVE models (about 1.6 GB) into this folder,
# where the patches find them by name.
cd "$(dirname "$0")"
API=https://play.forum.ircam.fr/rave-vst-api
for m in sol_ordinario sol_ordinario_fast sol_full isis VCTK nasa percussion musicnet vintage; do
  if [ -s "$m.ts" ]; then echo "have $m"; continue; fi
  echo "downloading $m ..."
  curl -fL --retry 2 -o "$m.ts.part" "$API/get_model?model_name=$m" && mv "$m.ts.part" "$m.ts" || { rm -f "$m.ts.part"; echo "failed: $m"; }
done
