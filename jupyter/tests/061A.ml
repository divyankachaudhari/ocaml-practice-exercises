type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check int) "empty_tree" 0 (count_leaves Empty)
let _ = Alcotest.(check int) "single_leaf" 1 (count_leaves (Node(1, Empty, Empty)))
let _ = Alcotest.(check int) "two_leaves" 2 (count_leaves (Node(1, Node(2, Empty, Empty), Node(2, Empty, Empty))))
let _ = Alcotest.(check int) "three_leaves" 3 (count_leaves (Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty))))
