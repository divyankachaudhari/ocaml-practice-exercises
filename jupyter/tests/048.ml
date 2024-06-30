type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr

let _ = Alcotest.(check (list (pair (list (pair string bool)) bool))) "example 1"
  [([("a", true); ("b", true)], true);
   ([("a", true); ("b", false)], true);
   ([("a", false); ("b", true)], false);
   ([("a", false); ("b", false)], false)]
  (table ["a"; "b"] (And (Var "a", Or (Var "a", Var "b"))))
