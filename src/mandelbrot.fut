let dot (r: f32, i: f32): f32 =
    (r * r) + (i * i)

let mulComplex (a: f32, b: f32) (c: f32, d: f32): (f32, f32) =
    ((a * c) - (b * d), (a * d) + (b * c))

let addComplex (a: f32, b: f32) (c: f32, d: f32): (f32, f32) =
    (a + c, b + d)

let divergence (depth: i32, c0: (f32, f32)): i32 =
    let (_, i) =
        loop (c, i) = (c0, 0) while (i < depth) && (dot c < 4.0) do
            (addComplex c0 (mulComplex c c), i + 1) in
    i

let mandelbrot (screenX: i32) (screenY: i32) (depth: i32) (xmin: f32)
        (ymin: f32) (xmax: f32) (ymax: f32) : [screenY][screenX]i32 =
    let sizeX = xmax - xmin
    let sizeY = ymax - ymin
    let f (x: i32) (y: i32): i32 =
        let x = r32 x
        let y = r32 y
        let screenX = r32 screenX
        let screenY = r32 screenY
        let c0 =
            (xmin + ((x * sizeX) / screenX), ymin + ((y * sizeY) / screenY)) in
        divergence(depth, c0) in
    map (\y -> map (\x -> f x y) (iota screenX)) (iota screenY)

let escapeToColour (depth: i32) (divergence: i32): i32 =
    if depth == divergence then
        0
    else
        let r = 3 * divergence
        let g = 5 * divergence
        let b = 7 * divergence in
        ((r << 16) | (g << 8) | b)

let main (screenX: i32) (screenY: i32) (depth: i32) (xmin: f32) (ymin: f32)
        (xmax: f32) (ymax: f32) : [screenY][screenX]i32 =
    map
        (\(row: [screenY]i32): [screenX]i32 -> map (escapeToColour depth) row)
        (mandelbrot screenX screenY depth xmin ymin xmax ymax)
