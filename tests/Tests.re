// Test "framework"

[@bs.scope "process"] [@bs.val] external exit: int => unit = "exit";
[@bs.module "@babel/code-frame"] [@bs.val] external codeFrameColumns: string => Js.t({..}) => Js.t({..}) => string = "codeFrameColumns";
[@bs.module "fs"] [@bs.val] external readFileSync: string => Js.t({..}) => string = "readFileSync";
[@bs.module "path"] [@bs.val] external join: string => string => string = "join";

let dirname = switch [%node(__dirname)] {
| None => ""
| Some(dirname) => dirname
}

// Display a code frame if the comparison fails
let run = (loc, left, comparator, right) => {
  if (!comparator(left, right)) {
    let ((file, line, _, _), _ ) = loc;
    let fileContent = readFileSync(join(dirname, file), {"encoding": "utf-8"});
    Js.Console.error({j|\u001b[31mTest Failure:\u001b[39m |j} ++ file);
    Js.Console.error(codeFrameColumns(fileContent, {"start": {"line": line}}, {"highlightCode": true}));
    Js.Console.error({j|\u001b[31mLeft:\u001b[39m|j});
    Js.Console.error(left);
    Js.Console.error({j|\u001b[31mRight:\u001b[39m|j});
    Js.Console.error(right);
    exit(1);
  }
}
