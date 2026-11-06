#!/bin/sh
# Downloads the 11 RAVE models (about 1.9 GB) into this folder, where the
# patches find them by name. They come from this repo's GitHub release.
cd "$(dirname "$0")"
URL=https://github.com/HAI-Res/rave-demos/releases/download/models-v1
for m in sol_ordinario sol_ordinario_fast sol_full isis VCTK nasa percussion musicnet vintage birds_z16 birds_z4; do
  if [ -s "$m.ts" ]; then echo "have $m"; continue; fi
  echo "downloading $m ..."
  curl -fL --retry 2 -o "$m.ts.part" "$URL/$m.ts" && mv "$m.ts.part" "$m.ts" || { rm -f "$m.ts.part"; echo "failed: $m"; }
done
