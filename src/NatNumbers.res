type rec nat = Zero | Succ(nat)

let zero = Zero
let one = Succ(zero)
let two = Succ(one)
let three = Succ(two)
let four = Succ(three)

let iszero = m => {
  switch m {
  | Zero => true
  | Succ(_) => false
  }
}

exception Pred_Zero

let pred = (n) => {
  switch (n) {
    | Zero => raise(Pred_Zero)
    | Succ(m) => m
  }
}

let rec add = (n1, n2) => {
  switch (n1) {
    | Zero => n2
    | Succ(m) => add(m, Succ(n2))
  }
}


let rec int_of_nat = (n) => {
  switch (n) {
    | Zero => 0
    | Succ(m) => 1 + int_of_nat(m)
  }
}

exception Nat_Of_Int_Negative;

let rec nat_of_int = (n) => {
  switch (n) {
    | 0 => Zero
    | i if i > 0 => Succ (nat_of_int(i - 1))
    | _  => raise(Nat_Of_Int_Negative)
  }
}

let rec even = (n) => {
  switch (n) {
    | Zero => true
    | Succ(m) => odd(m)
  }
} and odd = (n) => {
  switch (n) {
    | Zero => false
    | Succ(m) => even(m)
  }
}