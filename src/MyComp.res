@genType
type color =
  | Red
  | Blue;

@genType
@react.component
let make = (~name: string, ~color: color) => {
  let colorStr =
    switch (color) {
    | Red => "red"
    | Blue => "blue"
    };

  <div className={"color-" ++ colorStr}> {React.string(name)} </div>;
};