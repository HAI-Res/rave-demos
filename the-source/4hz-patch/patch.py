"""Cap THE SOURCE (v0.9.0) UI redraw timers at 250 ms (4 Hz).

Usage: python3 -I patch.py vst3|app <path to Mach-O binary inside the bundle>
Then re-sign the bundle: codesign --force --sign - <bundle>
"""
import sys, struct

# (offset, expected, replacement): editor scope/readout timer, meter timer, simulator scope timer -> 250 ms
PATCHES = {
    'vst3': [
        (0x620a4, 0x52800502, 0x52801F42),  # mov w2,#40      -> mov w2,#250
        (0x620ac, 0xB9400282, 0x52801F42),  # ldr w2,[x20]    -> mov w2,#250
        (0x61c58, 0x5280050B, 0x52801F4B),  # mov w11,#40     -> mov w11,#250
    ],
    'app': [
        (0x51ab8, 0x52800502, 0x52801F42),
        (0x51ac0, 0xB9400282, 0x52801F42),
        (0x5166c, 0x5280050B, 0x52801F4B),
    ],
}

kind, path = sys.argv[1], sys.argv[2]
data = bytearray(open(path, 'rb').read())
for off, old, new in PATCHES[kind]:
    cur = struct.unpack_from('<I', data, off)[0]
    if cur != old:
        sys.exit(f'unexpected bytes at {off:#x}: {cur:#010x}')
    struct.pack_into('<I', data, off, new)
open(path, 'wb').write(data)
print('patched')
