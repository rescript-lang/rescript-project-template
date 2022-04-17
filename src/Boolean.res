type boolean = True | False

let not = x => {
  switch x {
  | True => False
  | False => True
  }
}

let equive = (x, y) => {
  switch (x, y) {
  | (True, True) => True
  | (False, False) => True
  | (True, False) => False
  | (False, True) => False
  }
}

let or = (x, y) => {
  switch (x, y) {
  | (True, _) => True
  | (_, True) => True
  | (_, _) => False
  }
}

let boolean_to_str = x => {
  switch x {
  | True => "true"
  | False => "false"
  }
}

let res = or(True, False)
Js.log2(res, boolean_to_str(res))
