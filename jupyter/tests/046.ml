type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr

let _ = Alcotest.(check (list (triple bool bool bool))) "example 1"
  [(true, true, true); (true, false, true); (false, true, false); (false, false, false)]
  (table2 "a" "b" (And (Var "a", Or (Var "a", Var "b"))))

let _ = Alcotest.(check (list (triple bool bool bool))) "example 2"
  [(true, true, true); (true, false, true); (false, true, false); (false, false, false)]
  (table2 "a" "b" (Or (Var "a", And (Var "a", Var "b"))))
