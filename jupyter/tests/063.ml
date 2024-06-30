type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (binary_tree int)) "empty_list" Empty (complete_binary_tree [])

let _ = Alcotest.(check (binary_tree int)) "single_node"
  (Node(1, Empty, Empty))
  (complete_binary_tree [1])

let _ = Alcotest.(check (binary_tree int)) "small_list"
  (Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty)))
  (complete_binary_tree [1; 2; 3])

let _ = Alcotest.(check (binary_tree int)) "larger_list"
  (Node(1,
    Node(2, Node(4, Empty, Empty), Node(5, Empty, Empty)),
    Node(3, Node(6, Empty, Empty), Empty)))
  (complete_binary_tree [1; 2; 3; 4; 5; 6])
