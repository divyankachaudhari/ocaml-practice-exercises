type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let example_tree =
  Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
       Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))

let _ = Alcotest.(check (list char)) "empty_tree" [] (at_level Empty 1)
let _ = Alcotest.(check (list char)) "level_1_single_node" ['a'] (at_level example_tree 1)
let _ = Alcotest.(check (list char)) "level_2_two_nodes" ['b'; 'c'] (at_level example_tree 2)
let _ = Alcotest.(check (list char)) "level_3_four_nodes" ['d'; 'e'; 'f'] (at_level example_tree 3)
