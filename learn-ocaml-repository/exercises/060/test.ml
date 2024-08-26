open Test_lib
open Report

let exercise_hbal_tree_nodes =
  Section ([ Text "Function: "; Code "hbal_tree_nodes" ],
    test_function_1_against_solution
      [%ty: int -> char binary_tree list]
      "hbal_tree_nodes"
      ~gen:0
      [ 0; 1; 2 ])

let exercise_min_nodes =
  Section ([ Text "Function: "; Code "min_nodes" ],
    test_function_1_against_solution
      [%ty: int -> int]
      "min_nodes"
      ~gen:0
      [ 0; 1; 2; 3; 31 ])

let exercise_max_nodes =
  Section ([ Text "Function: "; Code "max_nodes" ],
    test_function_1_against_solution
      [%ty: int -> int]
      "max_nodes"
      ~gen:0
      [ 0; 1; 2; 3; 5; 6; 31 ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_hbal_tree_nodes; exercise_min_nodes; exercise_max_nodes ]
