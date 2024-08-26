open Test_lib
open Report


let exercise_cbal_tree =
  Section ([ Text "Function: "; Code "cbal_tree" ],
    test_function_1_against_solution
      [%ty: int -> char binary_tree list]
      "cbal_tree"
      ~gen:0
      [
        0; 
        1; 
        3; 
        4 
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_cbal_tree ]
