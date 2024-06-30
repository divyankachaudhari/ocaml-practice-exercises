type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (list (binary_tree char))) "Test Empty Tree"
  [Empty]
  (hbal_tree 0)

let _ = Alcotest.(check (list (binary_tree char))) "Test Single Node Tree"
  [Node ('x', Empty, Empty)]
  (hbal_tree 1)

let _ = Alcotest.(check (list (binary_tree char))) "Test Height 2 Tree"
  [Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty));
   Node ('x', Node ('x', Empty, Empty), Empty);
   Node ('x', Empty, Node ('x', Empty, Empty))]
  (hbal_tree 2)

let _ = Alcotest.(check int) "Test Empty Tree Height"
  0
  (tree_height Empty)

let _ = Alcotest.(check int) "Test Single Node Tree Height"
  1
  (tree_height (Node ('x', Empty, Empty)))

let _ = Alcotest.(check int) "Test Multi Node Height 3 Tree"
  3
  (tree_height (Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Empty, Node ('x', Empty, Empty)))))

let _ = Alcotest.(check int) "Test Different Heights Tree on both sides"
  3
  (tree_height (Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Node ('x', Empty, Empty)))))

let _ = Alcotest.(check int) "Test Asymmetric Heights Tree"
  3
  (tree_height (Node ('x', Node ('x', Node ('x', Empty, Empty), Empty), Empty)))

let _ = Alcotest.(check bool) "Test Random Tree Height is greater than or equal to 0"
  true
  (let height = tree_height (Node ('x', Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Empty, Node ('x', Empty, Empty))), Node ('x', Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)), Node ('x', Empty, Node ('x', Empty, Empty))))) in
  height >= 0)
