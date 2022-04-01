// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Hello = require("./Hello.bs.js");
var Belt_List = require("rescript/lib/js/belt_List.js");

console.log(Hello.hello);

function seq(i, j) {
  if (i > j) {
    return /* [] */0;
  } else {
    return {
            hd: i,
            tl: seq(i + 1 | 0, j)
          };
  }
}

function square(x) {
  return Math.imul(x, x);
}

function sum(t) {
  return Belt_List.reduce(t, 0, (function (a, b) {
                return a + b | 0;
              }));
}

function sum_sq(n) {
  return sum(Belt_List.map(seq(0, n), square));
}

var sum_sq_6 = sum_sq(6);

console.log(sum_sq_6);

exports.seq = seq;
exports.square = square;
exports.sum = sum;
exports.sum_sq = sum_sq;
exports.sum_sq_6 = sum_sq_6;
/*  Not a pure module */
