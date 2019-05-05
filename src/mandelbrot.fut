let dot(c: (f32, f32)): f32 =
    let (r, i) = c in
    r * r + i * i

let multComplex(x: (f32, f32), y: (f32, f32)): (f32, f32) =
    let (a, b) = x
    let (c, d) = y in
    ((a * c) - (b * d), (a * d) + (b * c))

let addComplex(x: (f32, f32), y: (f32, f32)): (f32, f32) =
    let (a, b) = x
    let (c, d) = y in
    (a + c, b + d)

let divergence(depth: i32, c0: (f32, f32)): i32 =
    let (_, i) =
        loop (c, i) = (c0, 0) while (i < depth) && (dot(c) < 4.0) do
            (addComplex(c0, multComplex(c, c)), i + 1) in
    i

let mandelbrot( screenX: i32
              , screenY: i32
              , depth: i32
              , xmin: f32
              , ymin: f32
              , xmax: f32
              , ymax: f32
              ): [screenY][screenX]i32 =
    let sizex = xmax - xmin
    let sizey = ymax - ymin
    let f (x: i32) (y: i32): i32 =
        let c0 =
            ( xmin + ((f32.i32 x) * sizex) / (f32.i32 screenX)
            , ymin + ((f32.i32 y) * sizey) / (f32.i32 screenY)
            ) in
        divergence(depth, c0) in
    map (\y -> (map (\x -> f x y) (iota screenX))) (iota screenY)


let escapeToColour(depth: i32, divergence: i32): i32 =
    if depth == divergence then
        0
    else
        let r = 3 * divergence
        let g = 5 * divergence
        let b = 7 * divergence in
        ((r << 16) | (g << 8) | b)

let main
    (screenX: i32)
    (screenY: i32)
    (depth: i32)
    (xmin: f32)
    (ymin: f32)
    (xmax: f32)
    (ymax: f32)
    : [screenY][screenX]i32 =
    let escapes =
        mandelbrot(screenX, screenY, depth, xmin, ymin, xmax, ymax) in
    let f x = escapeToColour (depth, x) in
    map (\(row: []i32): [screenX]i32 -> map f row) escapes
