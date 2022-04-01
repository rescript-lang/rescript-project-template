// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Pervasives = require("rescript/lib/js/pervasives.js");

function push(x, s) {
  return {
          hd: x,
          tl: s
        };
}

function peek(s) {
  if (s) {
    return s.hd;
  } else {
    return Pervasives.failwith("Empty");
  }
}

function pop(s) {
  if (s) {
    return s.tl;
  } else {
    return Pervasives.failwith("Empty");
  }
}

var ListStack = {
  empty: /* [] */0,
  push: push,
  peek: peek,
  pop: pop
};

var s$p = {
  hd: 1,
  tl: /* [] */0
};

console.log(s$p);

var s = /* [] */0;

exports.ListStack = ListStack;
exports.s = s;
exports.s$p = s$p;
/*  Not a pure module */
