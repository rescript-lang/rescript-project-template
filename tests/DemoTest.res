let equals = (a, b) => {
  a == b
}

let randomTests = (loc) => {
  [1, 5, 6, 9]->Js.Array2.forEach(num => {
    Tests.run(
      loc,
      Demo.add(num, num), equals, num * 2
    )
  })
}

// called by TestEverything.res
let run = () => {
  Tests.run(
    __POS_OF__("Adding 2 numbers should work"),
    Demo.add(1, 2), equals, 3
  )

  // example of using a helper and passing the right location
  randomTests(__POS_OF__("Adding random numbers should work too"))
}
