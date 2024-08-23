# Statement

In a height-balanced binary tree, the following property holds for every
node: The height of its left subtree and the height of its right subtree
are almost equal, which means their difference is not greater than one.

Write a function `hbal_tree` to construct height-balanced binary trees
for a given height. The function should generate all solutions via
backtracking. Put the letter `'x'` as information into all nodes of the
tree.


```ocaml
# let t = hbal_tree 3;;
val t : char binary_tree list =
  [Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
    Node ('x', Empty, Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
    Node ('x', Node ('x', Empty, Empty), Empty));
   Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
    Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
    Node ('x', Empty, Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
    Node ('x', Node ('x', Empty, Empty), Empty));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
    Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)),
    Node ('x', Empty, Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)),
    Node ('x', Node ('x', Empty, Empty), Empty));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)),
    Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
    Node ('x', Empty, Empty));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
    Node ('x', Empty, Empty));
   Node ('x', Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)),
    Node ('x', Empty, Empty));
   Node ('x', Node ('x', Empty, Empty),
    Node ('x', Empty, Node ('x', Empty, Empty)));
   Node ('x', Node ('x', Empty, Empty),
    Node ('x', Node ('x', Empty, Empty), Empty));
   Node ('x', Node ('x', Empty, Empty),
    Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)))]
```