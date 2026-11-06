// walk.js: a random walk through the latent space.
// bang       take one step: every dimension moves by a random amount
// stepsize x how big a typical step is (the standard deviation, in latent units)
// list ...   jump to this position (the bars, zero or random)
// The walk stays inside -3..3, the edge of what the model learned.
inlets = 1;
outlets = 1;

var z = [0, 0, 0, 0];
var ss = 0.15;

function stepsize(x) { ss = Math.max(0, x); }

function list() { z = arrayfromargs(arguments); }

function bang() {
    for (var i = 0; i < z.length; i++) {
        var v = z[i] + ss * gauss();
        z[i] = Math.max(-3, Math.min(3, v));
    }
    outlet(0, z);
}

// a normally distributed random number (Box-Muller)
function gauss() {
    var u = 1 - Math.random(), v = Math.random();
    return Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v);
}
