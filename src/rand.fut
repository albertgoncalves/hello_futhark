-- $ futhark pkg add github.com/diku-dk/cpprandom
-- $ futhark pkg sync

import "../lib/github.com/diku-dk/cpprandom/random"

module dist = uniform_real_distribution f32 minstd_rand

let main : f32 =
    let rng = minstd_rand.rng_from_seed [123] in
    let (_, x) = dist.rand (1, 6) rng in
    x
