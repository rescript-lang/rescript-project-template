type queue<'a> = {
  front: list<'a>,
  back: list<'a>,
}

let empty = {
  front: list{},
  back: list{}
}

let peek = q => {
  switch q {
    | {front: list{}} => None
    | {front: list{x, ..._}} => Some(x)
  }
}

let enqueue = (q, x) => {
  switch q {
    | {front: list{}} => {front: list{x}, back: list{}}
    | q => {...q, back: list{x, ...q.back}}
  }
}

let dequeue = q => {
  switch q {
    | {front: list{}} => None
    | {front: list{_, list{}}, back} => Some({front: Belt.List.reverse(back), back: list{}})
    | {front: list{_, ...t}, back} => Some({front: t, back})
  }
}


let q = empty->enqueue(1)->enqueue(2)->enqueue(3)
Js.log(q)

