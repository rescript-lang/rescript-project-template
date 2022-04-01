let even = x => mod(x, 2) == 0
let odd = x => mod(x, 2) == 1

let rec filter = (fn, lst) => {
  switch (lst) {
    | list{} => list{}
    | list{head, ... tail} => if (fn(head)) {Belt.List.add(filter(fn, tail), head)} else {filter(fn, tail) }
  }
}

let rec filter_aux = (fn, acc, lst) => {
  switch (lst) {
    | list{} => Belt.List.reverse(acc)
    | list{head, ... tail} => filter_aux(fn, if (fn(head)) {Belt.List.add(acc, head)} else { acc }, tail) 
  }
}

let filter_tr = (fn, lst) => filter_aux(fn, list{}, lst)

let lst = list{1, 2, 3, 4}
let filtered = filter_tr(even, lst)
Js.log(Belt.List.toArray(filtered))