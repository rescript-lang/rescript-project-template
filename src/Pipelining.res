open Hello
Js.log(hello)
let rec seq = (i, j) => if (i > j) { list{} }  else { list{i, ...seq(i + 1, j)} }
let square = x => x * x
let sum = t => Belt.List.reduce(t, 0, (a, b) => a + b)

let sum_sq = n =>seq(0, n)->Belt.List.map(square)->sum
let sum_sq_6 = sum_sq(6)
Js.log(sum_sq_6)
