type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list (binary_tree char))) "Example Test"
  [Node ('x', Node ('x', Empty, Empty), Node ('x', Node ('x', Empty, Empty), Empty));
   Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Empty), Node ('x', Empty, Empty));
   Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Empty, Empty))]
  (cbal_tree 4)

let _ = Alcotest.(check (list (binary_tree char))) "Empty Tree Test"
  [Empty]
  (cbal_tree 0)

let _ = Alcotest.(check (list (binary_tree char))) "Single Node Test"
  [Node ('x', Empty, Empty)]
  (cbal_tree 1)

let _ = Alcotest.(check (list (binary_tree char))) "Multi Nodes Test"
  [Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty))]
  (cbal_tree 3)
