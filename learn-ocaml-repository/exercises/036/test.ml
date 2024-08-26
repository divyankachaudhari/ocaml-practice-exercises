open Test_lib
open Report

let exercise_factors =
  Section ([ Text "Function: "; Code "factors" ],
    test_function_1_against_solution
      [%ty: int -> (int * int) list]
      "factors"
      ~gen:0
      [ 315
      ; 1  
      ; 13 
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_factors ]
