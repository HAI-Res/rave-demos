// slots.js: capture the bars into numbered slots and return to them.
// list ...    the bars' current values (kept, so a capture can store them)
// capture 1   the next slot clicked stores the current values
// int n       slot n was clicked: store (if capturing) or return to it
// clear       forget every slot (the model changed, so the sizes no longer fit)
inlets = 1;
outlets = 3;   // 0: values to return to   1: "n text label" for slot n   2: capture off

var cur = [];
var slots = {};
var capturing = 0;

function list() { cur = arrayfromargs(arguments); }

function capture(x) { capturing = x ? 1 : 0; }

function msg_int(n) {
    if (capturing) {
        slots[n] = cur.slice();
        outlet(1, n, "text", n + "●");
        capturing = 0;
        outlet(2, 0);
    } else if (slots[n]) {
        outlet(0, slots[n]);
    }
}

function clear() {
    slots = {};
    for (var n = 1; n <= 6; n++) outlet(1, n, "text", "" + n);
}
