module type Map = {
  type t<'k, 'v>
  let empty : t<'k, 'v>
  let insert: (t<'k, 'v>, 'k, 'v) => t<'k, 'v>
  let lookup: ( t<'k, 'v>, 'k) => 'v
  let bindings: (t<'k, 'v>) => list<('k, 'v)>
}

module AssocListMap : Map = {
  type t<'k, 'v> = list<('k, 'v)>
  let empty = list{}
  let insert = (m, k, v) => list{(k, v), ...m}
  let lookup = (m, k) => switch Belt.List.getAssoc(m, k, (a, b) => a == b) {
    | Some(v) => v
    | None => failwith("not found")
  }
  let keys = m => Belt.List.map(m, fst) -> Belt.List.sort((a, b) => Pervasives.compare(a, b))
  let bindings = m => keys(m)->Belt.List.map(k => (k, lookup(m, k)))
}

open AssocListMap
let m = empty->insert("e", 2.718)->insert("pi", 3.14)
let m' = m->insert("phi", 1.618)
let b = bindings(m)
let b' = bindings(m')

Js.log2(b, b')

module UniqAssocListMap : Map = {
  type t<'k, 'v> = list<('k, 'v)>
  let empty = list{}
  let insert = (m, k, v) => list{(k, v), ...Belt.List.removeAssoc(m, k, (a, b) => a == b)}
  let lookup = (m, k) => switch Belt.List.getAssoc(m, k, (a, b) => a == b) {
    | Some(v) => v
    | None => failwith("not found")
  }
  let keys = m => Belt.List.map(m, fst) -> Belt.List.sort((a, b) => Pervasives.compare(a, b))
  let bindings = m => keys(m)->Belt.List.map(k => (k, lookup(m, k)))
}