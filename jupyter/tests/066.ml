type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (binary_tree (pair char (pair int int)))) "test_layout_binary_tree_3_works_correctly"
  (Node (('a', 2, 1), Node (('b', 1, 2), Empty, Empty), Node (('c', 3, 2), Empty, Empty)))
  (layout_binary_tree_3 (Node ('a', Node ('b', Empty, Empty), Node ('c', Empty, Empty))))
