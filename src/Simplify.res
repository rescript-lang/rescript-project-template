type rec expr = Const(int) | Var(string) | Plus(expr, expr) | Mul(expr, expr)

let rec simplify = e => {
  switch e {
  | Plus(a, b) => simplify_plus(a, b)
  | Mul(a, b) => simplify_mul(a, b)
  | _ => e
  }
}
and simplify_plus = (a, b) => {
  switch (simplify(a), simplify(b)) {
  | (Const(a), Const(b)) => Const(a + b)
  | (Const(0), e) => simplify(e)
  | (e, Const(0)) => simplify(e)
  | (Const(a), Plus(b, Const(c))) => simplify(Plus(Const(a + c), b))
  | (Const(a), Plus(Const(b), c)) => simplify(Plus(Const(a + b), c))
  | (Plus(Const(a), b), Const(c)) => simplify(Plus(Const(a + c), b))
  | (Plus(a, Const(b)), Const(c)) => simplify(Plus(Const(b + c), a))
  | (x, y) => Plus(x, y)
  }
}
and simplify_mul = (a, b) => {
  switch (simplify(a), simplify(b)) {
  | (a, Plus(b, c)) => simplify(Plus(Mul(a, b), Mul(a, c)))
  | (Plus(a, b), c) => simplify(Plus(Mul(a, c), Mul(b, c)))
  | (Const(a), Mul(b, Const(c))) => simplify(Mul(Const(a * c), b))
  | (Const(a), Mul(Const(b), c)) => simplify(Mul(Const(a * b), c))
  | (Mul(Const(a), b), Const(c)) => simplify(Mul(Const(a * c), b))
  | (Mul(a, Const(b)), Const(c)) => simplify(Mul(Const(b * c), a))
  | (Const(0), _) => Const(0)
  | (_, Const(0)) => Const(0)
  | (Const(a), Const(b)) => Const(a * b)
  | (Const(1), b) => simplify(b)
  | (a, Const(1)) => simplify(a)
  | (x, y) => Mul(x, y)
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

let x = Mul(Mul(Plus(Const(2), Var("x")), Const(3)), Const(5))
let y = simplify(x)
Js.log3(string_of_expr(x), "=", string_of_expr(y))
