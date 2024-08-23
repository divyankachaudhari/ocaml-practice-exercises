# Statement

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