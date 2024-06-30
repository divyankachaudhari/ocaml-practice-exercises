type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree

let _ = Alcotest.(check (binary_tree (pair char (pair int int)))) "empty_tree"
  Empty
  (layout_binary_tree_1 Empty)

let _ = Alcotest.(check (binary_tree (pair char (pair int int)))) "example_tree"
  (Node (('n', 8, 1),
         Node (('k', 6, 2),
               Node (('c', 2, 3),
                     Node (('a', 1, 4), Empty, Empty),
                     Node (('h', 5, 4),
                           Node (('g', 4, 5),
                                 Node (('e', 3, 6), Empty, Empty), Empty), Empty)),
               Node (('m', 7, 3), Empty, Empty)),
         Node (('u', 12, 2),
               Node (('p', 9, 3), Empty,
                     Node (('s', 11, 4),
                           Node (('q', 10, 5), Empty, Empty), Empty)),
               Empty)))
  (let leaf x = Node (x, Empty, Empty) in
   layout_binary_tree_1 (Node ('n', Node ('k', Node ('c', leaf 'a',
                                                     Node ('h', Node ('g', leaf 'e', Empty), Empty)),
                                         leaf 'm'),
                              Node ('u', Node ('p', Empty, Node ('s', leaf 'q', Empty)), Empty))))
