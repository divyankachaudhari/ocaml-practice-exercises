type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check bool) "test_empty_tree"
  true
  (is_symmetric Empty)

let _ = Alcotest.(check bool) "test_single_node"
  true
  (is_symmetric (Node ('x', Empty, Empty)))

let _ = Alcotest.(check bool) "test_symmetric_tree"
  true
  (is_symmetric (Node ('a', Node ('b', Empty, Empty), Node ('b', Empty, Empty))))

let _ = Alcotest.(check bool) "test_asymmetric_tree"
  false
  (is_symmetric (Node ('a', Node ('b', Empty, Empty), Empty)))
