# Lists

## 001 Tail

Write a function `last : 'a list -> 'a option` that returns the last element of a list

```ocaml
# last ["a" ; "b" ; "c" ; "d"];;
- : string option = Some "d"
# last [];;
- : 'a option = None
```

## 002 Last Two

Find the last but one (last and penultimate) elements of a list.

```ocaml
# last_two ["a"; "b"; "c"; "d"];;
- : (string * string) option = Some ("c", "d")
# last_two ["a"];;
- : (string * string) option = None
```

## 003 nth element

Find the N'th element of a list.

**Remark:** OCaml has `List.nth` which numbers elements from `0` and
raises an exception if the index is out of bounds.

```ocaml
# List.nth ["a"; "b"; "c"; "d"; "e"] 2;;
- : string = "c"
# List.nth ["a"] 2;;
Exception: Failure "nth".
```

## 004 length of list

Find the number of elements of a list.

OCaml standard library has `List.length` but we ask that you reimplement
it. Bonus for a [tail recursive](http://en.wikipedia.org/wiki/Tail_call)
solution.

```ocaml
# length ["a"; "b"; "c"];;
- : int = 3
# length [];;
- : int = 0
```

## 005 reverse list

Reverse a list.

OCaml standard library has `List.rev` but we ask that you reimplement
it.


```ocaml
# rev ["a"; "b"; "c"];;
- : string list = ["c"; "b"; "a"]
```

## 006 palindrome

Find out whether a list is a palindrome.

**Hint:** A palindrome is its own reverse.

```ocaml
# is_palindrome ["x"; "a"; "m"; "a"; "x"];;
- : bool = true
# not (is_palindrome ["a"; "b"]);;
- : bool = true
```

## 007 flatten list

Flatten a nested list structure.

```ocaml
type 'a node =
  | One of 'a 
  | Many of 'a node list
```

```ocaml
# flatten [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]];;
- : string list = ["a"; "b"; "c"; "d"; "e"]
```

## 008 remove duplicates

Eliminate consecutive duplicates of list elements.

```ocaml
# compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string list = ["a"; "b"; "c"; "a"; "d"; "e"]
```

## 009 pack duplicates

Pack consecutive duplicates of list elements into sublists.

```ocaml
# pack ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"];;
- : string list list =
[["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"];
 ["e"; "e"; "e"; "e"]]
```

## 010 run length encoding

If you need so, refresh your memory about
[run-length encoding](http://en.wikipedia.org/wiki/Run-length_encoding).

Here is an example:

```ocaml
# encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : (int * string) list =
[(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
```

## 011 modified run length

Modify the result of the previous problem in such a way that if an
element has no duplicates it is simply copied into the result list. Only
elements with duplicates are transferred as (N E) lists.

Since OCaml lists are homogeneous, one needs to define a type to hold
both single elements and sub-lists.

<!-- $MDX skip -->
```ocaml
type 'a rle =
  | One of 'a
  | Many of int * 'a
```

```ocaml
# encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string rle list =
[Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
 Many (4, "e")]
```

## 012 run length decoding

Given a run-length code list generated as specified in the previous
problem, construct its uncompressed version.

```ocaml
#  decode [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")];;
- : string list =
["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
```

## 013 run decoding direct

Implement the so-called run-length encoding data compression method
directly. I.e. don't explicitly create the sublists containing the
duplicates, as in problem "[Pack consecutive duplicates of list elements into sublists](#9)", but only count them. As in problem
"[Modified run-length encoding](#10)", simplify the result list by replacing the singleton lists (1 X) by X.

```ocaml
# encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
- : string rle list =
[Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
 Many (4, "e")]
```

## 014 duplicate elements

Duplicate the elements of a list.

```ocaml
# duplicate ["a"; "b"; "c"; "c"; "d"];;
- : string list = ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]
```

## 015 replicate elements

Replicate the elements of a list a given number of times.

```ocaml
# replicate ["a"; "b"; "c"] 3;;
- : string list = ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"]
```

## 016 drop elements

Drop every N'th element from a list.

```ocaml
# drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3;;
- : string list = ["a"; "b"; "d"; "e"; "g"; "h"; "j"]
```

## 017 split list

Split a list into two parts; the length of the first part is given.

If the length of the first part is longer than the entire list, then the
first part is the list and the second part is empty.

```ocaml
# split ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3;;
- : string list * string list =
(["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"])
# split ["a"; "b"; "c"; "d"] 5;;
- : string list * string list = (["a"; "b"; "c"; "d"], [])
```

## 018 extract slice

Given two indices, `i` and `k`, the slice is the list containing the
elements between the `i`'th and `k`'th element of the original list
(both limits included). Start counting the elements with 0 (this is the
way the `List` module numbers elements).

```ocaml
# slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 2 6;;
- : string list = ["c"; "d"; "e"; "f"; "g"]
```

## 019 rotate list

Rotate a list N places to the left.

```ocaml
# rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
```

## 020 remove nth element

Remove the K'th element from a list.

The first element of the list is numbered 0, the second 1,...

```ocaml
# remove_at 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "c"; "d"]
```

## 021 insert element

Start counting list elements with 0.  If the position is larger or
equal to the length of the list, insert the element at the end.  (The
behavior is unspecified if the position is negative.)

```ocaml
# insert_at "alfa" 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "alfa"; "b"; "c"; "d"]
```

## 022 create list

If first argument is greater than second, produce a list in decreasing
order.

```ocaml
# range 4 9;;
- : int list = [4; 5; 6; 7; 8; 9]
```

## 023 extract random

The selected items shall be returned in a list. We use the `Random`
module but and initialise it with `Random.init 0` at the start of 
the function for reproducibility and validate the solution. To make the function truly random, however,
one should remove the call to `Random.init 0`

```ocaml
# rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["e"; "c"; "g"]
```

## 024 lotto

Draw N different random numbers from the set `1..M`.

The selected numbers shall be returned in a list.

```ocaml
# lotto_select 6 49;;
- : int list = [20; 28; 45; 16; 24; 38]
```

## 025 generate permutations

Generate a random permutation of the elements of a list.

```ocaml
# permutation ["a"; "b"; "c"; "d"; "e"; "f"];;
- : string list = ["c"; "d"; "f"; "e"; "b"; "a"]
```

## 026 generate combinations

Generate the combinations of K distinct objects chosen from the N elements of a list.

In how many ways can a committee of 3 be chosen from a group of 12
people? We all know that there are C(12,3) = 220 possibilities (C(N,K)
denotes the well-known binomial coefficients). For pure mathematicians,
this result may be great. But we want to really generate all the
possibilities in a list.

```ocaml
# extract 2 ["a"; "b"; "c"; "d"];;
- : string list list =
[["a"; "b"]; ["a"; "c"]; ["a"; "d"]; ["b"; "c"]; ["b"; "d"]; ["c"; "d"]]
```

## 027 group elements

Group the elements of a set into disjoint subsets

1. In how many ways can a group of 9 people work in 3 disjoint subgroups 
of 2, 3 and 4 persons? Write a function that generates all the
possibilities and returns them in a list.
2. Generalize the above function in a way that we can specify a list of
group sizes and the function will return a list of groups.

```ocaml
# group ["a"; "b"; "c"; "d"] [2; 1];;
- : string list list list =
[[["a"; "b"]; ["c"]]; [["a"; "c"]; ["b"]]; [["b"; "c"]; ["a"]];
 [["a"; "b"]; ["d"]]; [["a"; "c"]; ["d"]]; [["b"; "c"]; ["d"]];
 [["a"; "d"]; ["b"]]; [["b"; "d"]; ["a"]]; [["a"; "d"]; ["c"]];
 [["b"; "d"]; ["c"]]; [["c"; "d"]; ["a"]]; [["c"; "d"]; ["b"]]]
```

## 028 sort list

Sorting a list of lists according to length of sublists.

1. We suppose that a list contains elements that are lists themselves.
The objective is to sort the elements of this list according to their
length. E.g. short lists first, longer lists later, or vice versa.

2. Again, we suppose that a list contains elements that are lists
themselves. But this time the objective is to sort the elements of this
list according to their **length frequency**; i.e., in the default,
where sorting is done ascendingly, lists with rare lengths are placed
first, others with a more frequent length come later.

```ocaml
# length_sort [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"];
             ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]];;
- : string list list =
[["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"]; ["f"; "g"; "h"];
 ["i"; "j"; "k"; "l"]]
# frequency_sort [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"];
                ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]];;
- : string list list =
[["i"; "j"; "k"; "l"]; ["o"]; ["a"; "b"; "c"]; ["f"; "g"; "h"]; ["d"; "e"];
 ["d"; "e"]; ["m"; "n"]]
```

# Arithmetic

## 031 is prime

Determine whether a given integer number is prime.

```ocaml
# not (is_prime 1);;
- : bool = true
# is_prime 7;;
- : bool = true
# not (is_prime 12);;
- : bool = true
```

## 032 gcd

Determine the greatest common divisor of two positive integer numbers.

Use Euclid's algorithm.

```ocaml
# gcd 13 27;;
- : int = 1
# gcd 20536 7826;;
- : int = 2
```

## 033 is coprime

Determine whether two positive integer numbers are coprime.

Two numbers are coprime if their greatest common divisor equals 1.

```ocaml
# coprime 13 27;;
- : bool = true
# not (coprime 20536 7826);;
- : bool = true
```

## 034 euler totient

Euler's so-called totient function φ(m) is defined as the number of
positive integers r (1 ≤ r < m) that are coprime to m. We let φ(1) = 1.

Find out what the value of φ(m) is if m is a prime number.  Euler's
totient function plays an important role in one of the most widely used
public key cryptography methods (RSA). In this exercise you should use
the most primitive method to calculate this function (there are smarter
ways that we shall discuss later).

```ocaml
# phi 10;;
- : int = 4
```

## 035 prime factor

Construct a flat list containing the prime factors in ascending order.


```ocaml
# factors 315;;
- : int list = [3; 3; 5; 7]
```

## 036 prime factor 2

Construct a list containing the prime factors and their multiplicity.

**Hint:** The problem is similar to problem
[Run-length encoding of a list (direct solution)](#10).

```ocaml
# factors 315;;
- : (int * int) list = [(3, 2); (5, 1); (7, 1)]
```

## 037 euler totent improved

See problem "[Calculate Euler&#39;s totient function φ(m)](#34)" for
the definition of Euler's totient function. If the list of the prime
factors of a number m is known in the form of the previous problem then
the function phi(m) can be efficiently calculated as follows: Let
`[(p1, m1); (p2, m2); (p3, m3); ...]` be the list of prime factors
(and their multiplicities) of a given number m. Then φ(m) can be
calculated with the following formula:

φ(m) = (p1 - 1) × p1<sup>m1 - 1</sup> × (p2 - 1) ×
p2<sup>m2 - 1</sup> × (p3 - 1) × p3<sup>m3 - 1</sup> × ⋯

```ocaml
# phi_improved 10;;
- : int = 4
# phi_improved 13;;
- : int = 12
```

## 039 list prime

Given a range of integers by its lower and upper limit, construct a list
of all prime numbers in that range.

```ocaml
# List.length (all_primes 2 7920);;
- : int = 1000
```

## 040 goldbach conjecture

Goldbach's conjecture says that every positive even number greater than
2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of
the most famous facts in number theory that has not been proved to be
correct in the general case. It has been *numerically confirmed* up to
very large numbers. Write a function to find the two prime numbers that
sum up to a given even integer.

```ocaml
# goldbach 28;;
- : int * int = (5, 23)
```

## 041 goldbach composition

Given a range of integers by its lower and upper limit, print a list of
all even numbers and their Goldbach composition.

In most cases, if an even number is written as the sum of two prime
numbers, one of them is very small. Very rarely, the primes are both
bigger than say 50. Try to find out how many such cases there are in the
range 2..3000.

```ocaml
# goldbach_list 9 20;;
- : (int * (int * int)) list =
[(10, (3, 7)); (12, (5, 7)); (14, (3, 11)); (16, (3, 13)); (18, (5, 13));
 (20, (3, 17))]
```

# Logic and Codes

## 046 truth table

Let us define a small "language" for boolean expressions containing
variables:

```ocaml
# type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr;;
type bool_expr =
    Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr
```

A logical expression in two variables can then be written in prefix
notation.  For example, `(a ∨ b) ∧ (a ∧ b)` is written:

```ocaml
# And (Or (Var "a", Var "b"), And (Var "a", Var "b"));;
- : bool_expr = And (Or (Var "a", Var "b"), And (Var "a", Var "b"))
```

Define a function, `table2` which returns the truth table of a given
logical expression in two variables (specified as arguments). The return
value must be a list of triples containing
`(value_of_a, value_of_b, value_of_expr)`.

```ocaml
# table2 "a" "b" (And (Var "a", Or (Var "a", Var "b")));;
- : (bool * bool * bool) list =
[(true, true, true); (true, false, true); (false, true, false);
 (false, false, false)]
```

## 048 truth table 2

Generalize the previous problem in such a way that the logical
expression may contain any number of logical variables. Define `table`
in a way that `table variables expr` returns the truth table for the
expression `expr`, which contains the logical variables enumerated in
`variables`.

```ocaml
# table ["a"; "b"] (And (Var "a", Or (Var "a", Var "b")));;
- : ((string * bool) list * bool) list =
[([("a", true); ("b", true)], true); ([("a", true); ("b", false)], true);
 ([("a", false); ("b", true)], false); ([("a", false); ("b", false)], false)]
```

## 049 gray code

An n-bit Gray code is a sequence of n-bit strings constructed according
to certain rules. For example,

```text
n = 1: C(1) = ['0', '1'].
n = 2: C(2) = ['00', '01', '11', '10'].
n = 3: C(3) = ['000', '001', '011', '010', '110', '111', '101', '100'].
```
Find out the construction rules and write a function with the following
specification: `gray n` returns the `n`-bit Gray code.

```ocaml
# gray 1;;
- : string list = ["0"; "1"]
# gray 2;;
- : string list = ["00"; "01"; "11"; "10"]
# gray 3;;
- : string list = ["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"]
```

## 050 huffman code

First of all, consult a good book on discrete mathematics or algorithms
for a detailed description of Huffman codes (you can start with the
[Wikipedia page](http://en.wikipedia.org/wiki/Huffman_coding))!

We consider a set of symbols with their frequencies.
For example, if the alphabet is `"a"`,..., `"f"`
(represented as the positions 0,...5) and
respective frequencies are 45, 13, 12, 16, 9, 5:

```ocaml
# let fs = [("a", 45); ("b", 13); ("c", 12); ("d", 16);
          ("e", 9); ("f", 5)];;
val fs : (string * int) list =
  [("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5)]
```

Our objective is to construct the
Huffman code `c` word for all symbols `s`. In our example, the result could
be
`hs = [("a", "0"); ("b", "101"); ("c", "100"); ("d", "111");
("e", "1101"); ("f", "1100")]`
(or `hs = [("a", "1");...]`). The task shall be performed by the function
`huffman` defined as follows: `huffman(fs)` returns the Huffman code
table for the frequency table `fs`

```ocaml
# huffman fs;;
- : (string * string) list =
[("a", "0"); ("c", "100"); ("b", "101"); ("f", "1100"); ("e", "1101");
 ("d", "111")]
```

# Binary Trees

## 055 balanced btree

![Binary Tree](/media/problems/binary-tree.gif)

*A binary tree is either empty or it is composed of a root element and
two successors, which are binary trees themselves.*

In OCaml, one can define a new type `binary_tree` that carries an
arbitrary value of type `'a` (thus is polymorphic) at each node.

```ocaml
# type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree;;
type 'a binary_tree = Empty | Node of 'a * 'a binary_tree * 'a binary_tree
```

An example of tree carrying `char` data is:

```ocaml
# let example_tree =
  Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
       Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)));;
val example_tree : char binary_tree =
  Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
   Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))
```

In OCaml, the strict type discipline *guarantees* that, if you get a
value of type `binary_tree`, then it must have been created with the two
constructors `Empty` and `Node`.

In a completely balanced binary tree, the following property holds for
every node: The number of nodes in its left subtree and the number of
nodes in its right subtree are almost equal, which means their
difference is not greater than one.

Write a function `cbal_tree` to construct completely balanced binary
trees for a given number of nodes. The function should generate all
solutions via backtracking. Put the letter `'x'` as information into all
nodes of the tree.

```ocaml
# cbal_tree 4;;
- : char binary_tree/2 list =
[Node ('x', Node ('x', Empty, Empty),
  Node ('x', Node ('x', Empty, Empty), Empty));
 Node ('x', Node ('x', Empty, Empty),
  Node ('x', Empty, Node ('x', Empty, Empty)));
 Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
  Node ('x', Empty, Empty));
 Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
  Node ('x', Empty, Empty))]
```

## 056 symmetric btree

Let us call a binary tree symmetric if you can draw a vertical line
through the root node and then the right subtree is the mirror image of
the left subtree. Write a function `is_symmetric` to check whether a
given binary tree is symmetric.

**Hint:** Write a function `is_mirror` first to check whether one tree
 is the mirror image of another. We are only interested in the
 structure, not in the contents of the nodes.

## 057 bst

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

## 058 generate and test

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

## 059 height balanced btree

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

## 060 height balanced btree 2

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

## 061A count leaves

A leaf is a node with no successors. Write a function `count_leaves` to
count them.

```ocaml
# count_leaves Empty;;
- : int = 0
```

## 061B collect leaves

A leaf is a node with no successors. Write a function `leaves` to
collect them in a list.

```ocaml
# leaves Empty;;
- : 'a list = []
```

## 062A collect nodes

An internal node of a binary tree has either one or two non-empty
successors. Write a function `internals` to collect them in a list.

```ocaml
# internals (Node ('a', Empty, Empty));;
- : char list = []
```

## 062B collect nodes 2

A node of a binary tree is at level N if the path from the root to the
node has length N-1. The root node is at level 1. Write a function
`at_level t l` to collect all nodes of the tree `t` at level `l` in a
list.

```ocaml
# let example_tree =
  Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
       Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)));;
val example_tree : char binary_tree =
  Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
   Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))
# at_level example_tree 2;;
- : char list = ['b'; 'c']
```

Using `at_level` it is easy to construct a function `levelorder` which
creates the level-order sequence of the nodes. However, there are more
efficient ways to do that.

## 063 create btree

A *complete* binary tree with height H is defined as follows: The levels
1,2,3,...,H-1 contain the maximum number of nodes (i.e 2<sup>i-1</sup>
at the level i, note that we start counting the levels from 1 at the
root). In level H, which may contain less than the maximum possible
number of nodes, all the nodes are "left-adjusted". This means that in a
levelorder tree traversal all internal nodes come first, the leaves come
second, and empty successors (the nil's which are not really nodes!)
come last.

Particularly, complete binary trees are used as data structures (or
addressing schemes) for heaps.

We can assign an address number to each node in a complete binary tree
by enumerating the nodes in levelorder, starting at the root with
number 1. In doing so, we realize that for every node X with address A
the following property holds: The address of X's left and right
successors are 2\*A and 2\*A+1, respectively, supposed the successors do
exist. This fact can be used to elegantly construct a complete binary
tree structure. Write a function `is_complete_binary_tree` with the
following specification: `is_complete_binary_tree n t` returns `true`
iff `t` is a complete binary tree with `n` nodes.

```ocaml
# complete_binary_tree [1; 2; 3; 4; 5; 6];;
- : int binary_tree =
Node (1, Node (2, Node (4, Empty, Empty), Node (5, Empty, Empty)),
 Node (3, Node (6, Empty, Empty), Empty))
```

## 064 btree layout 1

As a preparation for drawing the tree, a layout algorithm is required to
determine the position of each node in a rectangular grid. Several
layout methods are conceivable, one of them is shown in the illustration.


![Binary Tree Grid](/media/problems/tree-layout1.gif)

In this layout strategy, the position of a node v is obtained by the
following two rules:

* *x(v)* is equal to the position of the node v in the *inorder*
 sequence;
* *y(v)* is equal to the depth of the node *v* in the tree.

In order to store the position of the nodes, we will enrich the value
at each node with the position `(x,y)`.

The tree pictured above is
```ocaml
# let example_layout_tree =
  let leaf x = Node (x, Empty, Empty) in
  Node ('n', Node ('k', Node ('c', leaf 'a',
                           Node ('h', Node ('g', leaf 'e', Empty), Empty)),
                 leaf 'm'),
       Node ('u', Node ('p', Empty, Node ('s', leaf 'q', Empty)), Empty));;
val example_layout_tree : char binary_tree =
  Node ('n',
   Node ('k',
    Node ('c', Node ('a', Empty, Empty),
     Node ('h', Node ('g', Node ('e', Empty, Empty), Empty), Empty)),
    Node ('m', Empty, Empty)),
   Node ('u', Node ('p', Empty, Node ('s', Node ('q', Empty, Empty), Empty)),
    Empty))
```

```ocaml
# layout_binary_tree_1 example_layout_tree;;
- : (char * int * int) binary_tree =
Node (('n', 8, 1),
 Node (('k', 6, 2),
  Node (('c', 2, 3), Node (('a', 1, 4), Empty, Empty),
   Node (('h', 5, 4),
    Node (('g', 4, 5), Node (('e', 3, 6), Empty, Empty), Empty), Empty)),
  Node (('m', 7, 3), Empty, Empty)),
 Node (('u', 12, 2),
  Node (('p', 9, 3), Empty,
   Node (('s', 11, 4), Node (('q', 10, 5), Empty, Empty), Empty)),
  Empty))
```

## 065 btree layout 2

![Binary Tree Grid](/media/problems/tree-layout2.gif)

An alternative layout method is depicted in this illustration. Find
out the rules and write the corresponding OCaml function.

**Hint:** On a given level, the horizontal distance between
neighbouring nodes is constant.

The tree shown is 
```ocaml
# let example_layout_tree =
  let leaf x = Node (x, Empty, Empty) in
  Node ('n', Node ('k', Node ('c', leaf 'a',
                           Node ('e', leaf 'd', leaf 'g')),
                 leaf 'm'),
       Node ('u', Node ('p', Empty, leaf 'q'), Empty));;
val example_layout_tree : char binary_tree =
  Node ('n',
   Node ('k',
    Node ('c', Node ('a', Empty, Empty),
     Node ('e', Node ('d', Empty, Empty), Node ('g', Empty, Empty))),
    Node ('m', Empty, Empty)),
   Node ('u', Node ('p', Empty, Node ('q', Empty, Empty)), Empty))
```

```ocaml
# layout_binary_tree_2 example_layout_tree ;;
- : (char * int * int) binary_tree =
Node (('n', 15, 1),
 Node (('k', 7, 2),
  Node (('c', 3, 3), Node (('a', 1, 4), Empty, Empty),
   Node (('e', 5, 4), Node (('d', 4, 5), Empty, Empty),
    Node (('g', 6, 5), Empty, Empty))),
  Node (('m', 11, 3), Empty, Empty)),
 Node (('u', 23, 2),
  Node (('p', 19, 3), Empty, Node (('q', 21, 4), Empty, Empty)), Empty))
```

## 066 btree layout 3

![Binary Tree Grid](/media/problems/tree-layout3.gif)

Yet another layout strategy is shown in the above illustration. The
method yields a very compact layout while maintaining a certain symmetry
in every node. Find out the rules and write the corresponding
predicate.

**Hint:** Consider the horizontal distance between a node and its successor
nodes. How tight can you pack together two subtrees to construct the
combined binary tree? This is a difficult problem. Don't give up too
early!

```ocaml
# let example_layout_tree =
  let leaf x = Node (x, Empty, Empty) in
  Node ('n', Node ('k', Node ('c', leaf 'a',
                           Node ('h', Node ('g', leaf 'e', Empty), Empty)),
                 leaf 'm'),
       Node ('u', Node ('p', Empty, Node ('s', leaf 'q', Empty)), Empty));;
val example_layout_tree : char binary_tree =
  Node ('n',
   Node ('k',
    Node ('c', Node ('a', Empty, Empty),
     Node ('h', Node ('g', Node ('e', Empty, Empty), Empty), Empty)),
    Node ('m', Empty, Empty)),
   Node ('u', Node ('p', Empty, Node ('s', Node ('q', Empty, Empty), Empty)),
    Empty))
# layout_binary_tree_3 example_layout_tree ;;
- : (char * int * int) binary_tree =
Node (('n', 5, 1),
 Node (('k', 3, 2),
  Node (('c', 2, 3), Node (('a', 1, 4), Empty, Empty),
   Node (('h', 3, 4),
    Node (('g', 2, 5), Node (('e', 1, 6), Empty, Empty), Empty), Empty)),
  Node (('m', 4, 3), Empty, Empty)),
 Node (('u', 7, 2),
  Node (('p', 6, 3), Empty,
   Node (('s', 7, 4), Node (('q', 6, 5), Empty, Empty), Empty)),
  Empty))
```

Which layout do you like most?

## 067 string of btree

![Binary Tree](/media/problems/binary-tree.gif)

Somebody represents binary trees as strings of the following type (see
example): `"a(b(d,e),c(,f(g,)))"`.

* Write an OCaml function `string_of_tree` which generates this
 string representation,
 if the tree is given as usual (as `Empty` or `Node(x,l,r)` term).
 Then write a function `tree_of_string` which does this inverse;
 i.e. given the string
 representation, construct the tree in the usual form. Finally,
 combine the two predicates in a single function `tree_string` which
 can be used in both directions.
* Write the same predicate `tree_string` using difference lists and a
 single predicate `tree_dlist` which does the conversion between a
 tree and a difference list in both directions.

For simplicity, suppose the information in the nodes is a single letter
and there are no spaces in the string.

```ocaml
# let example_layout_tree =
  let leaf x = Node (x, Empty, Empty) in
    (Node ('a', Node ('b', leaf 'd', leaf 'e'),
     Node ('c', Empty, Node ('f', leaf 'g', Empty))));;
val example_layout_tree : char binary_tree =
  Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
   Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))
```

## 068 sort btree

We consider binary trees with nodes that are identified by single
lower-case letters, as in the example of the previous problem.

1. Write functions `preorder` and `inorder`
   that construct the
   [preorder](https://en.wikipedia.org/wiki/Tree_traversal#Pre-order)
   and
   [inorder](https://en.wikipedia.org/wiki/Tree_traversal#In-order_.28symmetric.29)
 sequence of a given binary tree, respectively. The
 results should be atoms, e.g. 'abdecfg' for the preorder sequence of
 the example in the previous problem.
1. Can you use `preorder` from problem part 1 in the reverse
 direction; i.e. given a preorder sequence, construct a corresponding
 tree? If not, make the necessary arrangements.
1. If both the preorder sequence and the inorder sequence of the nodes
 of a binary tree are given, then the tree is determined
 unambiguously. Write a function `pre_in_tree` that does the job.
1. Solve problems 1 to 3 using
   [difference lists](https://en.wikipedia.org/wiki/Difference_list).
   Cool!  Use the
 function `timeit` (defined in problem “[Compare the two methods of
 calculating Euler&#39;s totient function.](#38)”) to compare the
 solutions.

What happens if the same character appears in more than one node. Try
for instance `pre_in_tree "aba" "baa"`.

```ocaml
# preorder (Node (1, Node (2, Empty, Empty), Empty));;
- : int list = [1; 2]
```
