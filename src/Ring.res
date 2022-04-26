module type Ring = {
  type t
  let zero: t
  let one: t
  let plus: (t, t) => t
  let mul: (t, t) => t
  let neg: t => t
  let to_string: t => string
}

module IntRing = {
  type t = int
  let zero = 0
  let one = 1
  let plus = (x, y) => x + y
  let mul = (x, y) => x * y
  let neg = x => -x
  let to_string = string_of_int
}

module FloatRing = {
  type t = float
  let zero = 0.
  let one = 1.
  let plus = (x, y) => x +. y
  let mul = (x, y) => x *. y
  let neg = x => -.x
  let to_string = Js.Float.toString
}

module Ax: Ring = IntRing
module Bx: Ring = FloatRing

module type INT_RING = Ring with type t = int
module type FLOAT_RING = Ring with type t = float

module FloatRing2: Ring with type t = float = {
  type t = float
  let zero = 0.
  let one = 1.
  let plus = (x, y) => x +. y
  let mul = (x, y) => x *. y
  let neg = x => -.x
  let to_string = Js.Float.toString
}

module type XY = {
  type x
  type y
}

module type T = {
  module A: XY
}

module B = {
  type x = int
  type y = float
}

module type U = T with module A = B

module C: U = {
  module A = {
    type x = int
    type y = float
    // let x = 42
  }
}
