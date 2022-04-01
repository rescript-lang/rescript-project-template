let fn = x =>
  if x > 0 {
    x
  } else {
    raise(Not_found)
  }

let res = try {
  fn(-1)
} catch {
| Not_found => 0
}

Js.log("res is" ++ Js.Int.toString(res))
