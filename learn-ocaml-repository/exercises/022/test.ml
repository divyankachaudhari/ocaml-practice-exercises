open Test_lib
open Report

let exercise_range =
  Section ([ Text "Function: "; Code "range" ],
    test_function_2_against_solution
      [%ty: int -> int -> int list]
      "range"
      ~gen:0
      [ (4, 9)
      ; (9, 4)
      ; (4, 4)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_range ]
