
Consider a height-balanced binary tree of height `h`. What is the
maximum number of nodes it can contain? Clearly,
max_nodes = 2<sup>`h`</sup> - 1.

```ocaml
# let max_nodes h = 1 lsl h - 1;;
val max_nodes : int -> int = <fun>
```

## Minimum of nodes

However, what is the minimum number min_nodes? This question is more
difficult. Try to find a recursive statement and turn it into a function
`min_nodes` defined as follows: `min_nodes h` returns the minimum number
of nodes in a height-balanced binary tree of height `h`.

## Minimum height

On the other hand, we might ask: what are the minimum (resp. maximum)
height H a
height-balanced binary tree with N nodes can have?
`min_height` (resp. `max_height n`) returns
the minimum (resp. maximum) height of a height-balanced binary tree
with `n` nodes.

## Constructing trees

Now, we can attack the main problem: construct all the height-balanced
binary trees with a given number of nodes. `hbal_tree_nodes n` returns a
list of all height-balanced binary tree with `n` nodes.

Find out how many height-balanced trees exist for `n = 15`.

```ocaml
# List.length (hbal_tree_nodes 15);;
- : int = 1553
```
