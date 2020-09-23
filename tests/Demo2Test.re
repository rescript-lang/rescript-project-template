let equals = (a, b) => {
  a == b
};

// a failing test
Tests.run(
  __POS_OF__("1 + 3 = 2"),
  Demo.add(1, 3), equals, 2
);
