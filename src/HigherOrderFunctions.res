let square = x => {
  x * x
}

let double = x => x + x

let twice = (f, x) => {
  f(f(x))
}

let eighth = twice(twice(square))

let apply = (f, x) => f(x)
let pipeline = (x, f) => f(x)

let compose = (f, g, x) => f(g(x))
let square_then_double = compose(double, square)
let x = square_then_double(1)
let y = square_then_double(2)

let both = (f, g, x) => (f(x), g(x))
let ds = both(square, double)
let z = ds(5)
Js.log(z)

let cond = (p, f, g, x) =>
  if p(x) {
    f(x)
  } else {
    g(x)
  }
