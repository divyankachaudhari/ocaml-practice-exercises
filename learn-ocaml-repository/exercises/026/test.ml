open Test_lib
open Report

let exercise_extract =
  Section ([ Text "Function: "; Code "extract" ],
    test_function_2_against_solution
      [%ty: int -> 'a list -> 'a list list]
      "extract"
      ~gen:0
      [ (0, ["a"])
      ; (2, ["a"; "b"; "c"; "d"])
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_extract ]
