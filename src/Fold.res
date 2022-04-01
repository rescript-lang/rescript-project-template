let rec fold_left = (f, acc, lst) => {
  switch (lst) {
    | list{} => acc
    | list{h, ...t} => Belt.List.add(fold_left(f, acc, t), f(acc, h))
  }
}
/*
let rec fold_right = (f, lst, acc) => {
  switch (lst) {
    | list{} => acc
    | list{h, ...t} => f(h, fold_right(f, t, f(h, acc)))
  }
}

type fold_func = ('b, 'a) => 'b

let rec fold_left' = (~func as f: fold_func, ~accumulator as acc: 'b, ~lst as l: list<'a>) => {
  switch (l) {
    | list{} => acc
    | list{h, ...t} => Belt.List.add(fold_left'(f, acc, t), f(acc, h))
  }
}
*/

