open Test_lib
open Report

let exercise_hbal_tree =
  Section ([ Text "Function: "; Code "hbal_tree" ],
    test_function_1_against_solution
      [%ty: int -> char binary_tree list]
      "hbal_tree"
      ~gen:0
      [ 0; 1; 2 ])

let exercise_tree_height =
  Section ([ Text "Function: "; Code "tree_height" ],
    test_function_1_against_solution
      [%ty: char binary_tree -> int]
      "tree_height"
      ~gen:0
      [
        Empty;
        Node ('x', Empty, Empty);
        Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Empty, Node ('x', Empty, Empty)));
        Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Node ('x', Empty, Empty)));
        Node ('x', Node ('x', Node ('x', Empty, Empty), Empty), Empty);
        Node ('x',
          Node ('x',
            Node ('x', Empty, Empty),
            Node ('x', Empty, Empty)
          ),
          Node ('x',
            Node ('x', Empty, Empty),
            Node ('x', Empty, Empty)
          )
        )
      ]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_hbal_tree; exercise_tree_height ]
