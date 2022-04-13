@module("path") external dirname: string => string = "dirname"

let path = dirname("/a/b/c")
Js.log(path)