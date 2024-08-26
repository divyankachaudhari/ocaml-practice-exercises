open Test_lib
open Report

let exercise_phi =
  Section ([ Text "Function: "; Code "phi" ],
    test_function_1_against_solution
      [%ty: int -> int]
      "phi"
      ~gen:0
      [ 10
      ; 1  
      ; 13  
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_phi ]
