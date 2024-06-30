type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list char)) "empty_tree" [] (leaves Empty)
let _ = Alcotest.(check (list char)) "one_internal" [] (leaves (Node('a', Empty, Empty)))
let _ = Alcotest.(check (list char)) "two_internals" ['a'] (leaves (Node('a', Node('b', Empty, Empty), Empty)))
let _ = Alcotest.(check (list char)) "three_internals" ['b'; 'a'] (leaves (Node('a', Node('b', Node('c', Empty, Empty), Empty), Empty)))
