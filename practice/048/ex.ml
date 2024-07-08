open Alcotest

module type Testable = sig
  type bool_expr =
    | Var of string
    | Not of bool_expr
    | And of bool_expr * bool_expr
    | Or of bool_expr * bool_expr
  val table : string list -> bool_expr -> ((string * bool) list * bool) list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_example_1 () =
    check (list (pair (list (pair string bool)) bool)) "example 1" 
      [([("a", true); ("b", true)], true);
       ([("a", true); ("b", false)], true);
       ([("a", false); ("b", true)], false);
       ([("a", false); ("b", false)], false)]
      (table ["a"; "b"] (And (Var "a", Or (Var "a", Var "b"))))

  let run () =
    let open Alcotest in
    run "Truth Tables for Logical Expressions Tests" [
      "table", [
        test_case "example 1" `Quick test_example_1;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
