open Test_lib
open Report

let exercise_group =
  Section ([ Text "Function: "; Code "group" ],
    test_function_2_against_solution
      [%ty: 'a list -> int list -> 'a list list list]
      "group"
      ~gen:0
      [ ([], [])
      ; (["a"; "b"; "c"; "d"], [2; 1])
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_group ]
