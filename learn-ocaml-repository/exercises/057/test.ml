open Test_lib
open Report

let exercise_construct =
  Section ([ Text "Function: "; Code "construct" ],
    test_function_1_against_solution
      [%ty: int list -> int binary_tree]
      "construct"
      ~gen:0
      [
        [3; 2; 5; 7; 1];
        [5; 3; 18; 1; 4; 12; 21];
        [3; 2; 5; 7; 4]
      ]
  )

let exercise_is_symmetric =
  Section ([ Text "Function: "; Code "is_symmetric" ],
    test_function_1_against_solution
      [%ty: int binary_tree -> bool]
      "is_symmetric"
      ~gen:0
      [
        Node (5,
          Node (3, Node (1, Empty, Empty), Node (4, Empty, Empty)),
          Node (18, Node (12, Empty, Empty), Node (21, Empty, Empty)));
        Node (3,
          Node (2, Empty, Empty),
          Node (5, Node (4, Empty, Empty), Node (7, Empty, Empty)))
      ]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_construct; exercise_is_symmetric ]
