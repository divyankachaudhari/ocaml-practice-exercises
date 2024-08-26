open Test_lib
open Report

let exercise_sym_cbal_trees =
  Section ([ Text "Function: "; Code "sym_cbal_trees" ],
    test_function_1_against_solution
      [%ty: int -> char binary_tree list]
      "sym_cbal_trees"
      ~gen:0
      [
        5; 
        57 
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_sym_cbal_trees ]
