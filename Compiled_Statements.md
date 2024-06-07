# Compiled Exercise Statements
## Problem 001: Tail of a List

Write a function `last : 'a list -> 'a option` that returns the last element of a list

```ocaml
# last ["a" ; "b" ; "c" ; "d"];;
- : string option = Some "d"
# last [];;
- : 'a option = None
```

[Start working on this problem: 001](practice/001/work/impl.ml)

## Problem 002: Last Two Elements of a List

Find the last but one (last and penultimate) elements of a list.

```ocaml
# last_two ["a"; "b"; "c"; "d"];;
- : (string * string) option = Some ("c", "d")
# last_two ["a"];;
- : (string * string) option = None
```

[Start working on this problem: 002](practice/002/work/impl.ml)

## Problem 003: N'th Element of a List

Find the N'th element of a list.

**Remark:** OCaml has `List.nth` which numbers elements from `0` and
raises an exception if the index is out of bounds.

```ocaml
# List.nth ["a"; "b"; "c"; "d"; "e"] 2;;
- : string = "c"
# List.nth ["a"] 2;;
Exception: Failure "nth".
```

[Start working on this problem: 003](practice/003/work/impl.ml)

## Problem 004: Length of a List

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

[Start working on this problem: 004](practice/004/work/impl.ml)

## Problem 005: Reverse a List

Reverse a list.

OCaml standard library has `List.rev` but we ask that you reimplement
it.


```ocaml
# rev ["a"; "b"; "c"];;
- : string list = ["c"; "b"; "a"]
```

[Start working on this problem: 005](practice/005/work/impl.ml)

## Problem 006: Palindrome

Find out whether a list is a palindrome.

**Hint:** A palindrome is its own reverse.

```ocaml
# is_palindrome ["x"; "a"; "m"; "a"; "x"];;
- : bool = true
# not (is_palindrome ["a"; "b"]);;
- : bool = true
```

[Start working on this problem: 006](practice/006/work/impl.ml)

## Problem 007: Flatten a List

Flatten a nested list structure.

```ocaml
type 'a node =
  | One of 'a 
  | Many of 'a node list
```

[Start working on this problem: 007](practice/007/work/impl.ml)

## Problem 008: Eliminate Duplicates

Eliminate consecutive duplicates of list elements.

```ocaml
# compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string list = ["a"; "b"; "c"; "a"; "d"; "e"]
```

[Start working on this problem: 008](practice/008/work/impl.ml)

## Problem 009: Pack Consecutive Duplicates

Pack consecutive duplicates of list elements into sublists.

```ocaml
# pack ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"];;
- : string list list =
[["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"];
 ["e"; "e"; "e"; "e"]]
```

[Start working on this problem: 009](practice/009/work/impl.ml)

## Problem 010: Run-Length Encoding

If you need so, refresh your memory about
[run-length encoding](http://en.wikipedia.org/wiki/Run-length_encoding).

Here is an example:

```ocaml
# encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : (int * string) list =
[(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
```

[Start working on this problem: 010](practice/010/work/impl.ml)

## Problem 011: Modified Run-Length Encoding

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

[Start working on this problem: 011](practice/011/work/impl.ml)

## Problem 012: Decode a Run-Length Encoded List

Given a run-length code list generated as specified in the previous
problem, construct its uncompressed version.

```ocaml
#  decode [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")];;
- : string list =
["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
```

[Start working on this problem: 012](practice/012/work/impl.ml)

## Problem 013: Run-Length Encoding of a List (Direct Solution)

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

[Start working on this problem: 013](practice/013/work/impl.ml)

## Problem 014: Duplicate the Elements of a List

Duplicate the elements of a list.

```ocaml
# duplicate ["a"; "b"; "c"; "c"; "d"];;
- : string list = ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]
```

[Start working on this problem: 014](practice/014/work/impl.ml)

## Problem 015: Replicate the Elements of a List a Given Number of Times

Replicate the elements of a list a given number of times.

```ocaml
# replicate ["a"; "b"; "c"] 3;;
- : string list = ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"]
```

[Start working on this problem: 015](practice/015/work/impl.ml)

## Problem 016: Drop Every N'th Element From a List

Drop every N'th element from a list.

```ocaml
# drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3;;
- : string list = ["a"; "b"; "d"; "e"; "g"; "h"; "j"]
```

[Start working on this problem: 016](practice/016/work/impl.ml)

## Problem 017: Split a List Into Two Parts; The Length of the First Part Is Given

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

[Start working on this problem: 017](practice/017/work/impl.ml)

## Problem 018: Extract a Slice From a List

Given two indices, `i` and `k`, the slice is the list containing the
elements between the `i`'th and `k`'th element of the original list
(both limits included). Start counting the elements with 0 (this is the
way the `List` module numbers elements).

```ocaml
# slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 2 6;;
- : string list = ["c"; "d"; "e"; "f"; "g"]
```

[Start working on this problem: 018](practice/018/work/impl.ml)

## Problem 019: Rotate a List N Places to the Left

Rotate a list N places to the left.

```ocaml
# rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
```

[Start working on this problem: 019](practice/019/work/impl.ml)

## Problem 020: Remove the K'th Element From a List

Remove the K'th element from a list.

The first element of the list is numbered 0, the second 1,...

```ocaml
# remove_at 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "c"; "d"]
```

[Start working on this problem: 020](practice/020/work/impl.ml)

## Problem 021: Insert an Element at a Given Position Into a List

Start counting list elements with 0.  If the position is larger or
equal to the length of the list, insert the element at the end.  (The
behavior is unspecified if the position is negative.)

```ocaml
# insert_at "alfa" 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "alfa"; "b"; "c"; "d"]
```

[Start working on this problem: 021](practice/021/work/impl.ml)

## Problem 022: Create a List Containing All Integers Within a Given Range

If first argument is greater than second, produce a list in decreasing
order.

```ocaml
# range 4 9;;
- : int list = [4; 5; 6; 7; 8; 9]
```

[Start working on this problem: 022](practice/022/work/impl.ml)

## Problem 023: Extract a Given Number of Randomly Selected Elements From a List

The selected items shall be returned in a list. We use the `Random`
module but and initialise it with `Random.init 0` at the start of 
the function for reproducibility and validate the solution. To make the function truly random, however,
one should remove the call to `Random.init 0`

```ocaml
# rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["e"; "c"; "g"]
```

[Start working on this problem: 023](practice/023/work/impl.ml)

## Problem 024: Lotto

Draw N different random numbers from the set `1..M`.

The selected numbers shall be returned in a list.

```ocaml
# lotto_select 6 49;;
- : int list = [20; 28; 45; 16; 24; 38]
```

[Start working on this problem: 024](practice/024/work/impl.ml)

## Problem 025: Generate a Random Permutation of the Elements of a List

Generate a random permutation of the elements of a list.

```ocaml
# permutation ["a"; "b"; "c"; "d"; "e"; "f"];;
- : string list = ["c"; "d"; "f"; "e"; "b"; "a"]
```

[Start working on this problem: 025](practice/025/work/impl.ml)

## Problem 026: Generate the Combinations of K Distinct Objects Chosen From the N Elements of a List

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

[Start working on this problem: 026](practice/026/work/impl.ml)

## Problem 027: Group the Elements of a Set Into Disjoint Subsets

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

[Start working on this problem: 027](practice/027/work/impl.ml)

## Problem 028: Sorting a List of Lists According to Length of Sublists

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

[Start working on this problem: 028](practice/028/work/impl.ml)

## Problem 031: Determine Whether a Given Integer Number Is Prime

Determine whether a given integer number is prime.

```ocaml
# not (is_prime 1);;
- : bool = true
# is_prime 7;;
- : bool = true
# not (is_prime 12);;
- : bool = true
```

[Start working on this problem: 031](practice/031/work/impl.ml)

## Problem 032: Determine the Greatest Common Divisor of Two Positive Integer Numbers

Determine the greatest common divisor of two positive integer numbers.

Use Euclid's algorithm.

```ocaml
# gcd 13 27;;
- : int = 1
# gcd 20536 7826;;
- : int = 2
```

[Start working on this problem: 032](practice/032/work/impl.ml)

## Problem 033: Determine Whether Two Positive Integer Numbers Are Coprime

Determine whether two positive integer numbers are coprime.

Two numbers are coprime if their greatest common divisor equals 1.

```ocaml
# coprime 13 27;;
- : bool = true
# not (coprime 20536 7826);;
- : bool = true
```

[Start working on this problem: 033](practice/033/work/impl.ml)

## Problem 034: Calculate Euler's Totient Function Φ(m)

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

[Start working on this problem: 034](practice/034/work/impl.ml)

## Problem 035: Determine the Prime Factors of a Given Positive Integer

Construct a flat list containing the prime factors in ascending order.


```ocaml
# factors 315;;
- : int list = [3; 3; 5; 7]
```

[Start working on this problem: 035](practice/035/work/impl.ml)

## Problem 036: Determine the Prime Factors of a Given Positive Integer (2)

Construct a list containing the prime factors and their multiplicity.

**Hint:** The problem is similar to problem
[Run-length encoding of a list (direct solution)](#10).

```ocaml
# factors 315;;
- : (int * int) list = [(3, 2); (5, 1); (7, 1)]
```

[Start working on this problem: 036](practice/036/work/impl.ml)

## Problem 037: Calculate Euler's Totient Function Φ(m) (Improved)

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

[Start working on this problem: 037](practice/037/work/impl.ml)

## Problem 038: Compare the Two Methods of Calculating Euler's Totient Function

Use the solutions of problems 
"[Calculate Euler&#39;s totient function φ(m)](#34)" and
"[Calculate Euler&#39;s totient function φ(m) (improved)](#37)"
to compare the algorithms. Take the number of logical inferences as a measure for efficiency. Try to calculate φ(10090) as an example.

```ocaml
timeit phi 10090
```

[Start working on this problem: 038](practice/038/work/impl.ml)

## Problem 039: A List of Prime Numbers

Given a range of integers by its lower and upper limit, construct a list
of all prime numbers in that range.

```ocaml
# List.length (all_primes 2 7920);;
- : int = 1000
```

[Start working on this problem: 039](practice/039/work/impl.ml)

## Problem 040: Goldbach's Conjecture

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

[Start working on this problem: 040](practice/040/work/impl.ml)

## Problem 041: A List of Goldbach Compositions

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

[Start working on this problem: 041](practice/041/work/impl.ml)

## Problem 046: Truth Tables for Logical Expressions (2 Variables)

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

[Start working on this problem: 046](practice/046/work/impl.ml)

## Problem 048: Truth Tables for Logical Expressions

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

[Start working on this problem: 048](practice/048/work/impl.ml)

## Problem 049: Gray Code

An n-bit Gray code is a sequence of n-bit strings constructed according
to certain rules. For example,

```text
n = 1: C(1) = ['0', '1'].
n = 2: C(2) = ['00', '01', '11', '10'].
n = 3: C(3) = ['000', '001', '011', '010', '110', '111', '101', '100'].
```

[Start working on this problem: 049](practice/049/work/impl.ml)

## Problem 050: Huffman Code

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

[Start working on this problem: 050](practice/050/work/impl.ml)

## Problem 055: Construct Completely Balanced Binary Trees

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

[Start working on this problem: 055](practice/055/work/impl.ml)

## Problem 056: Symmetric Binary Trees

Let us call a binary tree symmetric if you can draw a vertical line
through the root node and then the right subtree is the mirror image of
the left subtree. Write a function `is_symmetric` to check whether a
given binary tree is symmetric.

**Hint:** Write a function `is_mirror` first to check whether one tree
 is the mirror image of another. We are only interested in the
 structure, not in the contents of the nodes.
```

[Start working on this problem: 056](practice/056/work/impl.ml)

## Problem 057: Binary Search Trees (Dictionaries)

Construct a 
[binary search tree](http://en.wikipedia.org/wiki/Binary_search_tree) 
from a list of integer numbers.

```ocaml
# construct [3; 2; 5; 7; 1];;
- : int binary_tree =
Node (3, Node (2, Node (1, Empty, Empty), Empty),
 Node (5, Empty, Node (7, Empty, Empty)))
```

[Start working on this problem: 057](practice/057/work/impl.ml)

## Problem 058: Generate-and-Test Paradigm

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

[Start working on this problem: 058](practice/058/work/impl.ml)

## Problem 059: Construct Height-Balanced Binary Trees

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

[Start working on this problem: 059](practice/059/work/impl.ml)

## Problem 060: Construct Height-Balanced Binary Trees With a Given Number of Nodes

Consider a height-balanced binary tree of height `h`. What is the
maximum number of nodes it can contain? Clearly,
max_nodes = 2<sup>`h`</sup> - 1.

```ocaml
# let max_nodes h = 1 lsl h - 1;;
val max_nodes : int -> int = <fun>
```

[Start working on this problem: 060](practice/060/work/impl.ml)

## Problem 61A: Count the Leaves of a Binary Tree

A leaf is a node with no successors. Write a function `count_leaves` to
count them.

```ocaml
# count_leaves Empty;;
- : int = 0
```

[Start working on this problem: 61A](practice/61A/work/impl.ml)

## Problem 61B: Collect the Leaves of a Binary Tree in a List

A leaf is a node with no successors. Write a function `leaves` to
collect them in a list.

```ocaml
# leaves Empty;;
- : 'a list = []
```

[Start working on this problem: 61B](practice/61B/work/impl.ml)

## Problem 62A: Collect the Internal Nodes of a Binary Tree in a List

An internal node of a binary tree has either one or two non-empty
successors. Write a function `internals` to collect them in a list.

```ocaml
# internals (Node ('a', Empty, Empty));;
- : char list = []
```

[Start working on this problem: 62A](practice/62A/work/impl.ml)

## Problem 62B: Collect the Nodes at a Given Level in a List

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

[Start working on this problem: 62B](practice/62B/work/impl.ml)

## Problem 063: Construct a Complete Binary Tree

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

[Start working on this problem: 063](practice/063/work/impl.ml)

## Problem 064: Layout a Binary Tree (1)

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

[Start working on this problem: 064](practice/064/work/impl.ml)

## Problem 065: Layout a Binary Tree (2)

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

[Start working on this problem: 065](practice/065/work/impl.ml)

## Problem 066: Layout a Binary Tree (3)

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

[Start working on this problem: 066](practice/066/work/impl.ml)

## Problem 067: A String Representation of Binary Trees

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

[Start working on this problem: 067](practice/067/work/impl.ml)

## Problem 068: Preorder and Inorder Sequences of Binary Trees

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

[Start working on this problem: 068](practice/068/work/impl.ml)

## Problem 069: Dotstring Representation of Binary Trees

We consider again binary trees with nodes that are identified by single
lower-case letters, as in the example of problem “[A string
representation of binary trees](#67)”. Such a tree can be
represented by the preorder sequence of its nodes in which dots (.) are
inserted where an empty subtree (nil) is encountered during the tree
traversal. For example, the tree shown in problem “[A string
representation of binary trees](#67)” is represented as
'abd..e..c.fg...'. First, try to establish a syntax (BNF or syntax
diagrams) and then write a function `tree_dotstring` which does the
conversion in both directions. Use difference lists.
```

[Start working on this problem: 069](practice/069/work/impl.ml)

## Problem 70A: Tree Construction From a Node String

![Multiway Tree](/media/problems/multiway-tree.gif)

*A multiway tree is composed of a root element and a (possibly empty)
set of successors which are multiway trees themselves. A multiway tree
is never empty. The set of successor trees is sometimes called a
forest.*

To represent multiway trees, we will use the following type which is a
direct translation of the definition:

```ocaml
# type 'a mult_tree = T of 'a * 'a mult_tree list;;
type 'a mult_tree = T of 'a * 'a mult_tree list
```

[Start working on this problem: 70A](practice/70A/work/impl.ml)

## Problem 70B: Count the Nodes of a Multiway Tree

```ocaml
# count_nodes (T ('a', [T ('f', []) ]));;
- : int = 2
```

[Start working on this problem: 70B](practice/70B/work/impl.ml)

## Problem 071: Determine the Internal Path Length of a Tree

We define the internal path length of a multiway tree as the total sum
of the path lengths from the root to all nodes of the tree. By this
definition, the tree `t` in the figure of the previous problem has an
internal path length of 9. Write a function `ipl tree` that returns the
internal path length of `tree`.

```ocaml
# ipl t;;
- : int = 9
```

[Start working on this problem: 071](practice/071/work/impl.ml)

## Problem 072: Construct the Bottom-Up Order Sequence of the Tree Nodes

Write a function `bottom_up t` which constructs the bottom-up sequence
of the nodes of the multiway tree `t`.

```ocaml
# bottom_up (T ('a', [T ('b', [])]));;
- : char list = ['b'; 'a']
# bottom_up t;;
- : char list = ['g'; 'f'; 'c'; 'd'; 'e'; 'b'; 'a']
```

[Start working on this problem: 072](practice/072/work/impl.ml)

## Problem 073: Lisp-Like Tree Representation

There is a particular notation for multiway trees in Lisp. The
picture shows how multiway tree structures are represented in Lisp.

![Lisp representation of trees](/media/problems/lisp-like-tree.png)

Note that in the "lispy" notation a node with successors (children) in
the tree is always the first element in a list, followed by its
children. The "lispy" representation of a multiway tree is a sequence of
atoms and parentheses '(' and ')'. This is very close to the way trees
are represented in OCaml, except that no constructor `T` is used. Write
a function `lispy : char mult_tree -> string` that returns the
lispy notation of the tree.

```ocaml
# lispy (T ('a', []));;
- : string = "a"
# lispy (T ('a', [T ('b', [])]));;
- : string = "(a b)"
# lispy t;;
- : string = "(a (f g) c (b d e))"
```

[Start working on this problem: 073](practice/073/work/impl.ml)

## Problem 080: Conversions

![A graph](/media/problems/graph1.gif)

*A graph is defined as a set of nodes and a set of edges, where each
edge is a pair of different nodes.*

There are several ways to represent graphs in OCaml.

* One method is to list all edges, an edge being a pair of nodes. In
 this form, the graph depicted opposite is represented as the
 following expression:

```ocaml
# [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')];;
- : (char * char) list =
[('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')]
```

[Start working on this problem: 080](practice/080/work/impl.ml)

## Problem 081: Path From One Node to Another One

Write a function `paths g a b` that returns all acyclic path `p` from
node `a` to node `b ≠ a` in the graph `g`. The function should return
the list of all paths via backtracking.

```ocaml
# let example_graph =
  {nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
   edges = [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')]};;
val example_graph : char graph_term =
  {nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
   edges = [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')]}
# paths example_graph 'f' 'b';;
- : char list list = [['f'; 'c'; 'b']; ['f'; 'b']]
```

[Start working on this problem: 081](practice/081/work/impl.ml)

## Problem 082: Cycle From a Given Node

Write a functions `cycle g a` that returns a closed path (cycle) `p`
starting at a given node `a` in the graph `g`. The predicate should
return the list of all cycles via backtracking.

```ocaml
# let example_graph =
  {nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
   edges = [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')]};;
val example_graph : char graph_term =
  {nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
   edges = [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')]}
# cycles example_graph 'f';;
- : char list list =
[['f'; 'b'; 'c'; 'f']; ['f'; 'c'; 'f']; ['f'; 'c'; 'b'; 'f'];
 ['f'; 'b'; 'f']; ['f'; 'k'; 'f']]
```

[Start working on this problem: 082](practice/082/work/impl.ml)

## Problem 083: Construct All Spanning Trees

![Spanning tree graph](/media/problems/spanning-tree-graph1.gif)

Write a function `s_tree g` to construct (by backtracking) all [spanning
trees](http://en.wikipedia.org/wiki/Spanning_tree) of a given graph `g`.
With this predicate, find out how many spanning trees there are for the
graph depicted to the left. The data of this example graph can be found
in the test below. When you have a correct solution for the `s_tree`
function, use it to define two other useful functions: `is_tree graph`
and `is_connected Graph`. Both are five-minutes tasks!

```ocaml
# let g = {nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
         edges = [('a', 'b'); ('a', 'd'); ('b', 'c'); ('b', 'e');
                  ('c', 'e'); ('d', 'e'); ('d', 'f'); ('d', 'g');
                  ('e', 'h'); ('f', 'g'); ('g', 'h')]};;
val g : char graph_term =
  {nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
   edges =
    [('a', 'b'); ('a', 'd'); ('b', 'c'); ('b', 'e'); ('c', 'e'); ('d', 'e');
     ('d', 'f'); ('d', 'g'); ('e', 'h'); ('f', 'g'); ('g', 'h')]}
```

[Start working on this problem: 083](practice/083/work/impl.ml)

## Problem 084: Construct the Minimal Spanning Tree

![Spanning tree graph](/media/problems/spanning-tree-graph2.gif)

Write a function `ms_tree graph` to construct the minimal spanning tree
of a given labelled graph. A labelled graph will be represented as
follows:

```ocaml
# type ('a, 'b) labeled_graph = {nodes : 'a list;
                               labeled_edges : ('a * 'a * 'b) list};;
type ('a, 'b) labeled_graph = {
  nodes : 'a list;
  labeled_edges : ('a * 'a * 'b) list;
}
```

[Start working on this problem: 084](practice/084/work/impl.ml)

## Problem 085: Graph Isomorphism

Two graphs G1(N1,E1) and G2(N2,E2) are isomorphic if there is a
bijection f: N1 → N2 such that for any nodes X,Y of N1, X and Y are
adjacent if and only if f(X) and f(Y) are adjacent.

Write a function that determines whether two graphs are isomorphic.

**Hint:** Use an open-ended list to represent the function f.

```ocaml
# let g = {nodes = [1; 2; 3; 4; 5; 6; 7; 8];
         edges = [(1, 5); (1, 6); (1, 7); (2, 5); (2, 6); (2, 8); (3, 5);
                  (3, 7); (3, 8); (4, 6); (4, 7); (4, 8)]};;
val g : int graph_term =
  {nodes = [1; 2; 3; 4; 5; 6; 7; 8];
   edges =
    [(1, 5); (1, 6); (1, 7); (2, 5); (2, 6); (2, 8); (3, 5); (3, 7);
     (3, 8); (4, 6); (4, 7); (4, 8)]}
```

[Start working on this problem: 085](practice/085/work/impl.ml)

## Problem 086: Node Degree and Graph Coloration

* Write a function `degree graph node` that determines the degree of a
 given node.
* Write a function that generates a list of all nodes of a graph
 sorted according to decreasing degree.
* Use [Welsh-Powell&#39;s
 algorithm](http://en.wikipedia.org/wiki/Graph_coloring#Greedy_coloring)
 to paint the nodes of a graph in such a way that adjacent nodes have
 different colors.
```

[Start working on this problem: 086](practice/086/work/impl.ml)

## Problem 087: Depth-First Order Graph Traversal

Write a function that generates a
[depth-first order graph traversal](https://en.wikipedia.org/wiki/Depth-first_search)
sequence. The starting point should be specified, and the output should
be a list of nodes that are reachable from this starting point (in
depth-first order).

Specifically, the graph will be provided by its
[adjacency-list representation](https://en.wikipedia.org/wiki/Adjacency_list)
and you must create a module `M` with the following signature:

```ocaml
# module type GRAPH = sig
    type node = char
    type t
    val of_adjacency : (node * node list) list -> t
    val dfs_fold : t -> node -> ('a -> node -> 'a) -> 'a -> 'a
  end;;
module type GRAPH =
  sig
    type node = char
    type t
    val of_adjacency : (node * node list) list -> t
    val dfs_fold : t -> node -> ('a -> node -> 'a) -> 'a -> 'a
  end
```

[Start working on this problem: 087](practice/087/work/impl.ml)

## Problem 088: Connected Components

Write a predicate that splits a graph into its [connected
components](http://en.wikipedia.org/wiki/Connected_component_%28graph_theory%29).
```

[Start working on this problem: 088](practice/088/work/impl.ml)

## Problem 089: Bipartite Graphs

Write a predicate that finds out whether a given graph is
[bipartite](http://en.wikipedia.org/wiki/Bipartite_graph).
```

[Start working on this problem: 089](practice/089/work/impl.ml)

## Problem 090: Generate K-Regular Simple Graphs With N Nodes

In a [K-regular graph](http://en.wikipedia.org/wiki/K-regular_graph) all
nodes have a degree of K; i.e. the number of edges incident in each node
is K. How many (non-isomorphic!) 3-regular graphs with 6 nodes are
there?

See also the [table of results](https://sites.google.com/site/prologsite/prolog-problems/6/solutions-6/p6_11.txt?attredirects=0&d=1).
```

[Start working on this problem: 090](practice/090/work/impl.ml)

## Problem 091: Eight Queens Problem

This is a classical problem in computer science. The objective is to
place eight queens on a chessboard so that no two queens are attacking
each other; i.e., no two queens are in the same row, the same column, or
on the same diagonal.

**Hint:** Represent the positions of the queens as a list of numbers 1..N.
Example: `[4; 2; 7; 3; 6; 8; 5; 1]` means that the queen in the first column is
in row 4, the queen in the second column is in row 2, etc. Use the
generate-and-test paradigm.

```ocaml
# queens_positions 4;;
- : int list list = [[3; 1; 4; 2]; [2; 4; 1; 3]]
```

[Start working on this problem: 091](practice/091/work/impl.ml)

## Problem 092: Knight's Tour

Another famous problem is this one: How can a knight jump on an N×N
chessboard in such a way that it visits every square exactly once?

**Hint:** Represent the squares by pairs of their coordinates `(x,y)`,
where both `x` and `y` are integers between 1 and N. Define the function
`jump n (x,y)` that returns all coordinates `(u,v)` to which a
knight can jump from `(x,y)` to on a `n`×`n` chessboard. And finally,
represent the solution of our problem as a list knight positions (the
knight's tour).
```

[Start working on this problem: 092](practice/092/work/impl.ml)

## Problem 093: Von Koch's Conjecture

Several years ago I met a mathematician who was intrigued by a problem
for which he didn't know a solution. His name was Von Koch, and I don't
know whether the problem has been solved since.

![Tree numbering](/media/problems/von-koch1.gif)

Anyway, the puzzle goes like this: Given a tree with N nodes (and hence
N-1 edges). Find a way to enumerate the nodes from 1 to N and,
accordingly, the edges from 1 to N-1 in such a way, that for each edge K
the difference of its node numbers equals to K. The conjecture is that
this is always possible.

For small trees the problem is easy to solve by hand. However, for
larger trees, and 14 is already very large, it is extremely difficult to
find a solution. And remember, we don't know for sure whether there is
always a solution!

![Larger tree](/media/problems/von-koch2.gif)

Write a function that calculates a numbering scheme for a given tree.
What is the solution for the larger tree pictured here?
```

[Start working on this problem: 093](practice/093/work/impl.ml)

## Problem 094: An Arithmetic Puzzle

Given a list of integer numbers, find a correct way of inserting
arithmetic signs (operators) such that the result is a correct equation.
Example: With the list of numbers `[2; 3; 5; 7; 11]` we can form the
equations 2 - 3 + 5 + 7 = 11 or 2 = (3 * 5 + 7) / 11 (and ten others!).
```

[Start working on this problem: 094](practice/094/work/impl.ml)

## Problem 095: English Number Words

On financial documents, like cheques, numbers must sometimes be written
in full words. Example: 175 must be written as one-seven-five. Write a
function `full_words` to print (non-negative) integer numbers in full
words.

```ocaml
# full_words 175;;
- : string = "one-seven-five"
```

[Start working on this problem: 095](practice/095/work/impl.ml)

## Problem 096: Syntax Checker

![Syntax graph](/media/problems/syntax-graph.gif)

In a certain programming language (Ada) identifiers are defined by the
syntax diagram (railroad chart) opposite. Transform the syntax diagram
into a system of syntax diagrams which do not contain loops; i.e. which
are purely recursive. Using these modified diagrams, write a function
`identifier : string -> bool` that can check whether or not a given
string is a legal identifier.

```ocaml
# identifier "this-is-a-long-identifier";;
- : bool = true
```

[Start working on this problem: 096](practice/096/work/impl.ml)

## Problem 097: Sudoku

Sudoku puzzles go like this:

```text
   Problem statement                 Solution

    .  .  4 | 8  .  . | .  1  7      9  3  4 | 8  2  5 | 6  1  7
            |         |                      |         |
    6  7  . | 9  .  . | .  .  .      6  7  2 | 9  1  4 | 8  5  3
            |         |                      |         |
    5  .  8 | .  3  . | .  .  4      5  1  8 | 6  3  7 | 9  2  4
    --------+---------+--------      --------+---------+--------
    3  .  . | 7  4  . | 1  .  .      3  2  5 | 7  4  8 | 1  6  9
            |         |                      |         |
    .  6  9 | .  .  . | 7  8  .      4  6  9 | 1  5  3 | 7  8  2
            |         |                      |         |
    .  .  1 | .  6  9 | .  .  5      7  8  1 | 2  6  9 | 4  3  5
    --------+---------+--------      --------+---------+--------
    1  .  . | .  8  . | 3  .  6      1  9  7 | 5  8  2 | 3  4  6
            |         |                      |         |
    .  .  . | .  .  6 | .  9  1      8  5  3 | 4  7  6 | 2  9  1
            |         |                      |         |
    2  4  . | .  .  1 | 5  .  .      2  4  6 | 3  9  1 | 5  7  8
```

[Start working on this problem: 097](practice/097/work/impl.ml)

## Problem 098: Nonograms

Around 1994, a certain kind of puzzles was very popular in England. The
"Sunday Telegraph" newspaper wrote: "Nonograms are puzzles from Japan
and are currently published each week only in The Sunday Telegraph.
Simply use your logic and skill to complete the grid and reveal a
picture or diagram." As an OCaml programmer, you are in a better
situation: you can have your computer do the work!

The puzzle goes like this: Essentially, each row and column of a
rectangular bitmap is annotated with the respective lengths of its
distinct strings of occupied cells. The person who solves the puzzle
must complete the bitmap given only these lengths.

```text
          Problem statement:          Solution:

          |_|_|_|_|_|_|_|_| 3         |_|X|X|X|_|_|_|_| 3
          |_|_|_|_|_|_|_|_| 2 1       |X|X|_|X|_|_|_|_| 2 1
          |_|_|_|_|_|_|_|_| 3 2       |_|X|X|X|_|_|X|X| 3 2
          |_|_|_|_|_|_|_|_| 2 2       |_|_|X|X|_|_|X|X| 2 2
          |_|_|_|_|_|_|_|_| 6         |_|_|X|X|X|X|X|X| 6
          |_|_|_|_|_|_|_|_| 1 5       |X|_|X|X|X|X|X|_| 1 5
          |_|_|_|_|_|_|_|_| 6         |X|X|X|X|X|X|_|_| 6
          |_|_|_|_|_|_|_|_| 1         |_|_|_|_|X|_|_|_| 1
          |_|_|_|_|_|_|_|_| 2         |_|_|_|X|X|_|_|_| 2
           1 3 1 7 5 3 4 3             1 3 1 7 5 3 4 3
           2 1 5 1                     2 1 5 1
```

[Start working on this problem: 098](practice/098/work/impl.ml)

## Problem 099: Crossword Puzzle

![Crossword](/media/problems/crossword.gif)

Given an empty (or almost empty) framework of a crossword puzzle and a
set of words. The problem is to place the words into the framework.

The particular crossword puzzle is specified in a text file which first
lists the words (one word per line) in an arbitrary order. Then, after
an empty line, the crossword framework is defined. In this framework
specification, an empty character location is represented by a dot (.).
In order to make the solution easier, character locations can also
contain predefined character values. The puzzle above is defined in the
file
[p7_09a.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09a.dat?attredirects=0&d=1),
other examples are
[p7_09b.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09b.dat?attredirects=0&d=1)
and
[p7_09d.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09d.dat?attredirects=0&d=1).
There is also an example of a puzzle
([p7_09c.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09c.dat?attredirects=0&d=1))
which does not have a solution.

Words are strings (character lists) of at least two characters. A
horizontal or vertical sequence of character places in the crossword
puzzle framework is called a site. Our problem is to find a compatible
way of placing words onto sites.

**Hints:**

1. The problem is not easy. You will need some time to thoroughly
 understand it. So, don't give up too early! And remember that the
 objective is a clean solution, not just a quick-and-dirty hack!
1. For efficiency reasons it is important, at least for larger puzzles,
 to sort the words and the sites in a particular order.
```

[Start working on this problem: 099](practice/099/work/impl.ml)

## Problem 101: Diagonal of a Sequence of Sequences

Write a function `diag : 'a Seq.t Seq.t -> 'a Seq` that returns the _diagonal_
of a sequence of sequences. The returned sequence is formed as follows:
The first element of the returned sequence is the first element of the first
sequence; the second element of the returned sequence is the second element of
the second sequence; the third element of the returned sequence is the third
element of the third sequence; and so on.
```

[Start working on this problem: 101](practice/101/work/impl.ml)

## Problem 100: Never-Ending Sequences

Lists are finite, meaning they always contain a finite number of elements. Sequences may
be finite or infinite.

The goal of this exercise is to define a type `'a stream` which only contains
infinite sequences. Using this type, define the following functions:
```ocaml
val hd : 'a stream -> 'a
(** Returns the first element of a stream *)
val tl : 'a stream -> 'a stream
(** Removes the first element of a stream *)
val take : int -> 'a stream -> 'a list
(** [take n seq] returns the n first values of [seq] *)
val unfold : ('a -> 'b * 'a) -> 'a -> 'b stream
(** Similar to Seq.unfold *)
val bang : 'a -> 'a stream
(** [bang x] produces an infinitely repeating sequence of [x] values. *)
val ints : int -> int stream
(* Similar to Seq.ints *)
val map : ('a -> 'b) -> 'a stream -> 'b stream
(** Similar to List.map and Seq.map *)
val filter: ('a -> bool) -> 'a stream -> 'a stream
(** Similar to List.filter and Seq.filter *)
val iter : ('a -> unit) -> 'a stream -> 'b
(** Similar to List.iter and Seq.iter *)
val to_seq : 'a stream -> 'a Seq.t
(** Translates an ['a stream] into an ['a Seq.t] *)
val of_seq : 'a Seq.t -> 'a stream
(** Translates an ['a Seq.t] into an ['a stream]
    @raise Failure if the input sequence is finite. *)
```

[Start working on this problem: 100](practice/100/work/impl.ml)

