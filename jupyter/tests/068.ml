type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list char)) "test_preorder_works_correctly"
  ['a'; 'b'; 'd'; 'e'; 'c'; 'f'; 'g']
  (preorder (Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
                   Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))))

let _ = Alcotest.(check (list char)) "test_inorder_works_correctly"
  ['d'; 'b'; 'e'; 'a'; 'c'; 'g'; 'f']
  (inorder (Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
                  Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))))

let _ = Alcotest.(check (binary_tree char)) "test_pre_in_tree_works_correctly"
  (Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
         Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty))))
  (pre_in_tree ['a'; 'b'; 'd'; 'e'; 'c'; 'f'; 'g'] ['d'; 'b'; 'e'; 'a'; 'c'; 'g'; 'f'])
