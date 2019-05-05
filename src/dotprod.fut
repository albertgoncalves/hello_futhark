module type F = {
    type t
    val add: t -> t -> t
    val mul: t -> t -> t
    val zero: t
}

module M = \(M: F) -> {
    let dotprod (x: []M.t) (y: []M.t): M.t =
        reduce M.add M.zero (map2 M.mul x y)
}

module I32 = M {
    type t = i32
    let add (a: t) (b: t): t = a + b
    let mul (a: t) (b: t): t = a * b
    let zero: t = 0
}

module F32 = M {
    type t = f32
    let add (a: t) (b: t): t = a + b
    let mul (a: t) (b: t): t = a * b
    let zero: t = 0
}

entry dotprod_i32 = I32.dotprod
entry dotprod_f32 = F32.dotprod
