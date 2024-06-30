type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check string) "test_string_of_tree"
  "a(b(d,e),c(,f(g,)))"
  (string_of_tree (Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
                         Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))))

let _ = Alcotest.(check (binary_tree char)) "test_tree_of_string"
  (Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
         Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty))))
  (tree_of_string "a(b(d,e),c(,f(g,)))")
