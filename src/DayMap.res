type day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

let int_of_day = d => {
  switch d {
  | Mon => 1
  | Tue => 2
  | Wed => 3
  | Thu => 4
  | Fri => 5
  | Sat => 6
  | Sun => 7
  }
}

module DayCmp = Belt.Id.MakeComparable({
  type t = day
  let cmp = (a, b) => Pervasives.compare(int_of_day(a), int_of_day(b))
})

let m = Belt.Map.make(~id=module(DayCmp))->Belt.Map.set(Mon, "Monday")->Belt.Map.set(Tue, "Tusday")
let arr = Belt.Map.toArray(m)
Js.log(arr)
