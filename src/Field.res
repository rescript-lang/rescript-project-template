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

module type Field = {
  include Ring
  let div: (t, t) => t
}

module IntField = {
  include IntRing
  let div = (x, y) => x/y
}

module FloatField = {
  include FloatRing
  let div = (x, y) => x/.y
}