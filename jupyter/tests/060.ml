type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list (binary_tree char))) "Test Height-Balanced Trees for Height 1"
  [Node ('x', Empty, Empty)]
  (hbal_tree_nodes 1)

let _ = Alcotest.(check (list (binary_tree char))) "Test Height-Balanced Trees for Height 2"
  [Node ('x', Node ('x', Empty, Empty), Empty); Node ('x', Empty, Node ('x', Empty, Empty))]
  (hbal_tree_nodes 2)

let _ = Alcotest.(check (list (binary_tree char))) "Test Height-Balanced Trees for Height 0"
  [Empty]
  (hbal_tree_nodes 0)

let _ = Alcotest.(check int) "Test min_nodes for h = 0"
  0
  (min_nodes 0)

let _ = Alcotest.(check int) "Test min_nodes for h = 1"
  1
  (min_nodes 1)

let _ = Alcotest.(check int) "Test min_nodes for h = 2"
  2
  (min_nodes 2)

let _ = Alcotest.(check int) "Test min_nodes for h = 3"
  4
  (min_nodes 3)

let _ = Alcotest.(check int) "Test max_nodes for h = 0"
  0
  (max_nodes 0)

let _ = Alcotest.(check int) "Test max_nodes for h = 1"
  1
  (max_nodes 1)

let _ = Alcotest.(check int) "Test max_nodes for h = 2"
  3
  (max_nodes 2)

let _ = Alcotest.(check int) "Test max_nodes for h = 3"
  7
  (max_nodes 3)

let _ = Alcotest.(check int) "Test max_nodes for h = 5"
  31
  (max_nodes 5)

let _ = Alcotest.(check int) "Test max_nodes for h = 6"
  63
  (max_nodes 6)

let _ = Alcotest.(check int) "Boundary Test for max_nodes h = 31"
  2147483647
  (max_nodes 31)

let _ = Alcotest.(check_raises "Invalid_argument max_nodes" (Invalid_argument "max_nodes")) "Boundary Test for max_nodes h = 32"
  (fun () -> max_nodes 32)

let _ = Alcotest.(check_raises "Invalid_argument max_nodes" (Invalid_argument "max_nodes")) "Boundary Test for max_nodes with large input"
  (fun () -> max_nodes max_int)
