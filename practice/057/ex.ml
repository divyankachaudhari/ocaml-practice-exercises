open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val is_symmetric : 'a binary_tree -> bool
  val construct : 'a list -> 'a binary_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let rec tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r
(*
  let rec tree_equal a b = 
    match a, b with
    | Empty, Empty -> true
    | Node (va, la, ra), Node (vb, lb, rb) -> va = vb && tree_equal la lb && tree_equal ra rb
    | _ -> false
*)
  let test_construct () =
    let tree = construct [3; 2; 5; 7; 1] in
    let expected_tree =
      Node (3, Node (2, Node (1, Empty, Empty), Empty),
            Node (5, Empty, Node (7, Empty, Empty)))
    in
    check (of_pp (tree_pp Format.pp_print_int)) "construct_test" expected_tree tree

  let test_symmetric () =
    let sym_tree = construct [5; 3; 18; 1; 4; 12; 21] in
    let asym_tree = construct [3; 2; 5; 7; 4] in
    check bool "symmetric_test_true" true (is_symmetric sym_tree);
    check bool "symmetric_test_false" false (is_symmetric asym_tree)

  let run () =
    let open Alcotest in
    run "Binary Search Trees Tests" [
      "construct", [
        test_case "construct_test" `Quick test_construct;
      ];
      "is_symmetric", [
        test_case "symmetric_test" `Quick test_symmetric;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
