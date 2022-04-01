type rec tree<'a> = 
  | Leaf
  | Node({value: 'a, left: tree<'a>, right: tree<'a>})

let t = Node({
  value: 2,
  left: Node({value: 1, left: Leaf, right: Leaf}),
  right: Node({value: 3, left: Leaf, right: Leaf})
})

let rec map = (f, t) => {
  switch (t) {
    | Leaf => Leaf
    | Node({value, left, right}) => Node({value: f(value), left: map(f, left), right: map(f, right)})
  }
}

let add1 = x => x + 1
let t_one = map(add1, t)
Js.log(t_one)

let rec fold = (acc, f, t) => {
  switch (t) {
    | Leaf => acc
    | Node({value, left, right}) => f(value, fold(acc, f, left), fold(acc, f, right))
  }
}

let sum = (x, y, z) => x + y + z
let tsum = fold(0, sum, t)
Js.log(tsum)

let rec filter = (f, t) => {
  switch (t) {
  | Leaf => Leaf
  | Node({value, left, right}) => if f(value) { Node({value: value, left: filter(f, left), right: filter(f, right)}) } else { Leaf }
  }
}

let even = x => mod(x, 2) == 0
let teven = filter(even, t)
Js.log(teven)
