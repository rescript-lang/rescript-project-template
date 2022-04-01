type rec tree<'a> = 
  | Leaf
  | Node({value: 'a, left: tree<'a>, right: tree<'a>})

let rec size = (t) => {
  switch t {
    | Leaf => 0
    | Node ({_, left, right}) => 1 + size(left) + size(right)
  }
}

let t = Node({
  value: 2,
  left: Node({value: 1, left: Leaf, right: Leaf}),
  right: Node({value: 3, left: Leaf, right: Leaf})
})