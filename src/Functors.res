module type X = {
  let x : int
}

module A : X = {
  let x = 0
}

module IncX = (M : X) => {
  let x = M.x + 1
}

module AddX = (M : X) => {
  let add = y => M.x + y
}

module B = IncX(A)
module C = IncX(B)
module Add42 = AddX(A)
