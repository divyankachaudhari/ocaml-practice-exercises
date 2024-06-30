type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list (binary_tree char))) "Test Symmetric Completely Balanced Binary Trees"
  [Node ('x', Node ('x', Node ('x', Empty, Empty), Empty), Node ('x', Empty, Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Node ('x', Empty, Empty), Empty))]
  (sym_cbal_trees 5)

let _ = Alcotest.(check int) "Test Number of Symmetric Trees with 57 Nodes"
  256
  (List.length (sym_cbal_trees 57))
