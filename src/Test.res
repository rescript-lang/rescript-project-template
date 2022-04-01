type rec nat = One | Succ(nat)

module Hello = {
  @react.component
  let make = () => {
    <div> {React.string("Hello World")} </div>
  }
}

module World = {
  @react.component
  let make = (~name: option<string>=?) => {
    let greeting = switch name {
    | Some(name) => "Hello " ++ name ++ "!"
    | None => "Hello stranger!"
    }
    <div> {React.string(greeting)} </div>
  }
}

let name = Some("Leonty")
switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<div><World ?name/><Hello /></div>, root)
| None => () // do nothing
}
