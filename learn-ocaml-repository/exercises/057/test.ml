open Test_lib
open Report

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    Message ([ Text "That was easy!" ], Success 1)
  ]
