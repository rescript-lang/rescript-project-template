
@genType
module type Math = {
  @genType
  let fact: int => int
}

@genType
module MyMath: Math = {
  let rec fact_aux = (n, acc) =>
    if n == 0 {
      acc
    } else {
      fact_aux(n - 1, n * acc)
    }

  @genType
  let fact = n => fact_aux(n, 1)
}
