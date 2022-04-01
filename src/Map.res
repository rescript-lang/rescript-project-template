let rec map = (fn, list) => {
  switch (list) {
    | list{} => list{}
    | list{head, ...tail} => list{fn(head), ...map(fn, tail)}
  }
}

let t1 = map(x => x + 1, list{1,2,3})
Js.log(t1)