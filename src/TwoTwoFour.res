type rec nat = Zero | Next(nat)

let one = Next(Zero)
let two = Next(one)
let three = Next(two)
let four = Next(three)

let rec sum = (a, b) => {
  switch (a) {
    | Zero => b
    | Next(x) => sum(x, Next(b))
  }
}

Js.log(sum(two, two) == four)