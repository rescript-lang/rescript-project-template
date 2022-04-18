type rec expr =
  | Const(int)
  | Var(string)
  | Plus(expr, expr)
  | Mul(expr, expr)
  | Pow(expr, int)
  | Diff(expr, string)

let rec simplify_plus = (a, b) => {
  switch (collect(a), collect(b)) {
  | (Const(0), e) => e
  | (e, Const(0)) => e
  | (Const(x), Const(y)) => Const(x + y)
  | _ => Plus(a, b)
  }
}
and simplify_mul = (a, b) => {
  switch (collect(a), collect(b)) {
  | (Const(0), _) => Const(0)
  | (_, Const(0)) => Const(0)
  | (Const(1), e) => e
  | (e, Const(1)) => e
  | (Const(x), Const(y)) => Const(x * y)
  | (Var(x), Mul(Const(c), Var(y))) if x == y => Mul(Const(c), Pow(Var(x), 2))
  | _ => Mul(a, b)
  }
}
and simplify_pow = (e, n) => {
  switch (e, n) {
  | (_, 0) => Const(1)
  | (e, 1) => e
  | _ => Pow(e, n)
  }
}
and simplify_diff = (e, x) => {
  switch e {
  | Const(_) => Const(0)
  | Var(v) =>
    if v == x {
      Const(1)
    } else {
      Const(0)
    }
  | Plus(e1, e2) => simplify(Plus(Diff(e1, x), Diff(e2, x)))
  | Mul(e1, e2) => simplify(Plus(Mul(e1, Diff(e2, x)), Mul(Diff(e1, x), e2)))
  | Pow(e, n) => simplify(Mul(Mul(Const(n), Pow(e, n - 1)), Diff(e, x)))
  | _ => Diff(e, x)
  }
}
and simplify = e => {
  switch e {
  | Plus(a, b) => simplify_plus(collect(a), collect(b))
  | Mul(a, b) => simplify_mul(collect(a), collect(b))
  | Pow(e, n) => simplify_pow(collect(e), n)
  | Diff(e, x) => simplify_diff(collect(e), x)
  | _ => e
  }
}
and collect = e => {
  let s = simplify(e)
  switch s {
  | Mul(a, Plus(b, c)) => simplify_plus(simplify_mul(a, b), simplify_mul(a, c))
  | Mul(Plus(a, b), c) => simplify_plus(simplify_mul(a, c), simplify_mul(b, c))
  | Mul(Const(a), Mul(b, Const(c))) => simplify_mul(Const(a * c), b)
  | Mul(Const(a), Mul(Const(b), c)) => simplify_mul(Const(a * b), c)
  | Mul(Mul(Const(a), b), Const(c)) => simplify_mul(Const(a * c), b)
  | Mul(Mul(a, Const(b)), Const(c)) => simplify_mul(Const(b * c), a)
  | _ => s
  }
}
let rec string_of_expr = e => {
  switch e {
  | Const(i) => string_of_int(i)
  | Var(s) => s
  | Plus(e1, e2) => "(" ++ string_of_expr(e1) ++ "+" ++ string_of_expr(e2) ++ ")"
  | Mul(e1, e2) => string_of_expr(e1) ++ "*" ++ string_of_expr(e2)
  | Pow(e, n) => string_of_expr(e) ++ "^" ++ string_of_int(n)
  | Diff(e, x) => "d(" ++ string_of_expr(e) ++ ")/d" ++ x
  }
}

let x = Var("x")
let f = Mul(Mul(Mul(Plus(Plus(Pow(x, 3), Mul(x, Const(77))), Const(5)), Const(4)), Const(3)), Const(3))
let d = Diff(f, "x")
Js.log3(string_of_expr(d), "=", string_of_expr(collect(d)))
