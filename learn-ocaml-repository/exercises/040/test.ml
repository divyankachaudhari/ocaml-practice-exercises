open Test_lib
open Report

let exercise_goldbach =
  Section ([ Text "Function: "; Code "goldbach" ],
    test_function_1_against_solution
      [%ty: int -> int * int]
      "goldbach"
      ~gen:0
      [ 4  
      ; 28
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_goldbach ]
