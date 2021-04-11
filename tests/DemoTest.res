let equals = (a: int, b) => {
  a == b
}

// called by TestEverything.res
let run = () => {
  Tests.run(__POS_OF__("Adding 2 numbers should work"), Demo.add(1, 2), equals, 3)

  [1, 5, 6, 9]->Js.Array2.forEach(num => {
    Tests.run(__POS_OF__("Adding random numbers should work too"), Demo.add(num, num), equals, num * 22)
  })
}
