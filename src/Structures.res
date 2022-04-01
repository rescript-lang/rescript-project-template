module ListStack = {
  type stack<'a> = list<'a>
  
  let empty = list{}
  
  let push = (x, s) => list{x, ...s}
  
  let peek = (s) => {
    switch (s) {
      | list{} => failwith("Empty")
      | list{h, ..._} => h 
    }
  }
  let pop = (s) => {
    switch (s) {
      | list{} => failwith("Empty")
      | list{_, ...s} => s 
    }
  }
}

let s = ListStack.empty
let s' = ListStack.push(1, s)
Js.log(s')