# Statement

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