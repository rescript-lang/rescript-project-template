Js.log("Hello, World!")

type ptype = TNormal | TFire | TWater

type peff = ENormal | ENotVery | ESuper

type mon = {
  name: string,
  hp: int,
  ptype: ptype,
}

let charmander = {
  name: "Charmander",
  hp: 39,
  ptype: TFire,
}

let eff = (t1, t2) => 
  switch (t1, t2) {
  | (TFire, TFire) | (TWater, TWater) | (TFire, TWater) => ENotVery
  | (TWater, TFire) => ESuper
  | _ => ENormal
  }

let ch_eff = eff(TFire, TWater)
Js.log(ch_eff)

let get_val = (x) => 
  switch x {
    | None => Js.log("it 's none")
    | Some(number) => Js.log("a number " ++ Js.Int.toString(number))
  }

get_val(Some(5))

let rec max_lst = (lst) => {
  switch lst {
    | list{} => None
    | list{h, ...tail} => switch max_lst(tail) {
      | None => Some(h)
      | Some(val) => Some (max(val, h))
    }
  }
}

let myList = list{1, 2, 3, 0}
switch max_lst(myList) {
  | None => Js.log("empty")
  | Some(val) => Js.log("max is " ++ Js.Int.toString(val))
}

type point = (float, float)
type shapes = 
  | Circle({center: point, radius: float})
  | Rectangle({lower_left: point, upper_right: point})
  | Point(point)

let avg = (a, b) => (a +. b) /. 2. 

let center = (shape) => {
  switch(shape) {
    | Circle({center, _}) => center
    | Rectangle({lower_left: (x_ll, y_ll), upper_right: (x_ur, y_ur)}) => (avg(x_ll, x_ur), avg(y_ll, y_ur))
    | Point(point) => point
    
  }
}

let c1 = Circle({center: (0., 0.), radius: 0.4})
let (x, y) = center(c1)
Js.log("center " ++ Js.Float.toString(x) ++ " " ++ Js.Float.toString(y))

