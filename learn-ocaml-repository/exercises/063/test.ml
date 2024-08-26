open Test_lib
open Report

let exercise_complete_binary_tree =
  Section ([ Text "Function: "; Code "complete_binary_tree" ],
    test_function_1_against_solution
      [%ty: int list -> int binary_tree]
      "complete_binary_tree"
      ~gen:0
      [
        []; 
        [1]; 
        [1; 2; 3]; 
        [1; 2; 3; 4; 5; 6]
      ]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_complete_binary_tree ]
