open Test_lib
open Report

let example_layout_tree =
  Node ('a', Node ('b', Empty, Empty), Node ('c', Empty, Empty))

let expected_layout =
  Node (('a', 2, 1),
        Node (('b', 1, 2), Empty, Empty),
        Node (('c', 3, 2), Empty, Empty))

let exercise_layout_binary_tree_2 =
  Section ([ Text "Function: "; Code "layout_binary_tree_2" ],
    test_function_1_against_solution
      [%ty: char binary_tree -> (char * int * int) binary_tree]
      "layout_binary_tree_2"
      ~gen:0
      [
        example_layout_tree
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_layout_binary_tree_2 ]
