# Statement

Apply the generate-and-test paradigm to construct all symmetric,
completely balanced binary trees with a given number of nodes.

```ocaml
# sym_cbal_trees 5;;
- : char binary_tree list =
[Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
  Node ('x', Empty, Node ('x', Empty, Empty)));
 Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
  Node ('x', Node ('x', Empty, Empty), Empty))]
```

How many such trees are there with 57 nodes? Investigate about how many
solutions there are for a given number of nodes? What if the number is
even? Write an appropriate function.

```ocaml
# List.length (sym_cbal_trees 57);;
- : int = 256
```