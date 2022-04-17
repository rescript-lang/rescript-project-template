type rec nat = Z | Succ(nat)

let rec plus = (x, y) => {
  switch (x, y) {
    | (Z, y) => y
    | (Succ(x), y) => Succ(plus(x, y))
  }
}

let rec mult = (x, y) => {
  switch (x, y) {
    | (Z, _) => Z
    | (Succ(n), k) => plus(k, mult(n, k))
  }
}

let rec int_of_nat = x => {
  switch x {
    | Z => 0
    | Succ(n) => 1 + int_of_nat(n)
  }
}

let one = Succ(Z)
let two = plus(one, one)
let four = mult(two, two)

Js.log3("two is", two, int_of_nat(two))
Js.log3("four is", four, int_of_nat(four))