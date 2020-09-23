let equals = (a, b) => {
  a == b
};

let notEquals = (a, b) => {
  a != b
};

let randomTests = (loc) => {
  [|1, 5, 6, 9|]->Js.Array2.forEach(num => {
    Tests.run(
      loc,
      Demo.add(num, num), equals, num * 2
    )
  })
}

let init = () => {
  Tests.run(
    __POS_OF__("Adding 2 numbers should work"),
    Demo.add(1, 2), equals, 3
  );

  // example of using a helper and passing the right location
  randomTests(__POS_OF__("Adding random numbers should work too"))

 // uncomment to see failing test
  Tests.run(
    __POS_OF__("1 + 3 = 2"),
    Demo.add(1, 3), equals, 2
  );
}