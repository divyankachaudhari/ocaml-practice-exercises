open Test_lib
open Report

let exercise_is_symmetric =
  Section ([ Text "Function: "; Code "is_symmetric" ],
    test_function_1_against_solution
      [%ty: 'a binary_tree -> bool]
      "is_symmetric"
      ~gen:0
      [
        Empty;
        Node ('x', Empty, Empty);
        Node ('a', Node ('b', Empty, Empty), Node ('b', Empty, Empty));
        Node ('a', Node ('b', Empty, Empty), Empty)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_is_symmetric ]
