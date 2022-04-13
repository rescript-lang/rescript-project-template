import { make as MyComp } from "./MyComp.gen.tsx";

const App = () => {
  return (<div>
    <h1> My Component </h1>
    <MyComp color="Blue" name="ReScript & TypeScript" />
  </div>);
};
