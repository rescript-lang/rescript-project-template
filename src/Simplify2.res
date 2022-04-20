type rec expr = Const(int) | Var(string) | Plus(expr, expr) | Mul(expr, expr)

let simplify = e => {
  switch e {
    | Plus(a, Plus(b, c)) if a == b => Plus(Mul(Const(2), a), c)
    | _ => e
	}
}

let rec string_of_expr = e => {
  switch e {
  | Const(c) => string_of_int(c)
  | Var(v) => v
  | Plus(a, b) => "(" ++ string_of_expr(a) ++ " + " ++ string_of_expr(b) ++ ")"
  | Mul(a, b) => string_of_expr(a) ++ " * " ++ string_of_expr(b)
  }
}

let a = Plus(Const(1), Const(2))
let b = Plus(Const(1), Const(2))
let c = Const(123)
let e = Plus(a, Plus(b, c))
let f = simplify(e)
Js.log(string_of_expr(f))