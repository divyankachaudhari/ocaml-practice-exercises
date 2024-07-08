open Alcotest

module type Testable = sig
  type bool_expr =
    | Var of string
    | Not of bool_expr
    | And of bool_expr * bool_expr
    | Or of bool_expr * bool_expr

  val table2 : string -> string -> bool_expr -> (bool * bool * bool) list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_example_1 () =
    check (list (triple bool bool bool)) "example 1" 
      [(true, true, true); (true, false, true); (false, true, false); (false, false, false)]
      (table2 "a" "b" (And (Var "a", Or (Var "a", Var "b"))))

  let test_example_2 () =
    check (list (triple bool bool bool)) "example 2" 
      [(true, true, true); (true, false, true); (false, true, false); (false, false, false)]
      (table2 "a" "b" (Or (Var "a", And (Var "a", Var "b"))))

  let run () =
    let open Alcotest in
    run "Truth Table for Two Variables Tests" [
      "table2", [
        test_case "example 1" `Quick test_example_1;
        test_case "example 2" `Quick test_example_2;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
