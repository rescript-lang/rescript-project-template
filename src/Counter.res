// Counter.res
module Document = {
  type t;
  @val external document: t = "document";
  @set external setTitle: (t, string) => unit = "title"
}

module Counter = {
  @react.component
  let make = () => {
    let (count, setCount) = React.useState(_ => 0);
  
    React.useEffect(() => {
      open Document
      document->setTitle(`You clicked ${Belt.Int.toString(count)} times!`)
      None
    }, );
  
    let onClick = (_evt) => {
      setCount(prev => prev + 1)
    };
  
    let msg = "You clicked " ++ Belt.Int.toString(count) ++  " times"
  
    <div>
      <p>{React.string(msg)}</p>
      <button onClick> {React.string("Click me")} </button>
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<Counter />, root)
| None => () // do nothing
}