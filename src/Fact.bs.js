// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';


function fact(n) {
  var _n = n;
  var _acc = 1;
  while(true) {
    var acc = _acc;
    var n$1 = _n;
    if (n$1 === 0) {
      return acc;
    }
    _acc = Math.imul(n$1, acc);
    _n = n$1 - 1 | 0;
    continue ;
  };
}

var MyMath = {
  fact: fact
};

exports.MyMath = MyMath;
/* No side effect */
