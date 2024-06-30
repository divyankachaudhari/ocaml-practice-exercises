type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (binary_tree int)) "construct_test"
  (Node (3, Node (2, Node (1, Empty, Empty), Empty),
         Node (5, Empty, Node (7, Empty, Empty))))
  (construct [3; 2; 5; 7; 1])

let _ = Alcotest.(check bool) "symmetric_test 1"
  true
  (is_symmetric (construct [5; 3; 18; 1; 4; 12; 21]))

let _ = Alcotest.(check bool) "symmetric_test 2"
  false
  (is_symmetric (construct [3; 2; 5; 7; 4]))
