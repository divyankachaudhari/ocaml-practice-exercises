# Statement

Construct a 
[binary search tree](http://en.wikipedia.org/wiki/Binary_search_tree) 
from a list of integer numbers.

```ocaml
# construct [3; 2; 5; 7; 1];;
- : int binary_tree =
Node (3, Node (2, Node (1, Empty, Empty), Empty),
 Node (5, Empty, Node (7, Empty, Empty)))
```

Then use this function to test the solution of the previous problem.

```ocaml
# is_symmetric (construct [5; 3; 18; 1; 4; 12; 21]);;
- : bool = true
# not (is_symmetric (construct [3; 2; 5; 7; 4]));;
- : bool = true
```