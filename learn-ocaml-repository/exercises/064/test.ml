open Test_lib
open Report

let leaf x = Node (x, Empty, Empty)

let example_layout_tree =
  Node ('n', Node ('k', Node ('c', leaf 'a',
                               Node ('h', Node ('g', leaf 'e', Empty), Empty)),
                    leaf 'm'),
        Node ('u', Node ('p', Empty, Node ('s', leaf 'q', Empty)), Empty))

let expected_layout =
  Node (('n', 8, 1),
        Node (('k', 6, 2),
              Node (('c', 2, 3),
                    Node (('a', 1, 4), Empty, Empty),
                    Node (('h', 5, 4),
                          Node (('g', 4, 5),
                                Node (('e', 3, 6), Empty, Empty), Empty), Empty)),
              Node (('m', 7, 3), Empty, Empty)),
        Node (('u', 12, 2),
              Node (('p', 9, 3), Empty,
                    Node (('s', 11, 4),
                          Node (('q', 10, 5), Empty, Empty), Empty)),
              Empty))

let exercise_layout_binary_tree_1 =
  Section ([ Text "Function: "; Code "layout_binary_tree_1" ],
    test_function_1_against_solution
      [%ty: char binary_tree -> (char * int * int) binary_tree]
      "layout_binary_tree_1"
      ~gen:0
      [
        Empty;
        example_layout_tree
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_layout_binary_tree_1 ]
