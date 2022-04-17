type rec expr =
  | Const(int)
  | Var(string)
  | Plus(list<expr>)
  | Mul(list<expr>)
  | Pow(expr, int)
  | Diff(expr, string)
  
