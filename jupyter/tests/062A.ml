type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list char)) "empty_tree" [] (internals Empty)
let _ = Alcotest.(check (list char)) "one_internal" [] (internals (Node('a', Empty, Empty)))
let _ = Alcotest.(check (list char)) "two_internals" ['a'] (internals (Node('a', Node('b', Empty, Empty), Empty)))
let _ = Alcotest.(check (list char)) "three_internals" ['b'; 'a'] (internals (Node('a', Node('b', Node('c', Empty, Empty), Empty), Empty)))
