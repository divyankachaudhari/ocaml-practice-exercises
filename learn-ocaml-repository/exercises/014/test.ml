open Test_lib
open Report

let exercise_duplicate =
  Section ([ Text "Function: "; Code "duplicate" ],
    test_function_1_against_solution
      [%ty: 'a list -> 'a list]
      "duplicate"
      ~gen:0
      [ ["a"; "b"; "c"; "c"; "d"]
      ; []
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_duplicate ]
