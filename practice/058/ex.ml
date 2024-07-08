open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val sym_cbal_trees : int -> char binary_tree list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r

  let tree_equal a b = 
    match a, b with
    | Empty, Empty -> true
    | Node (va, la, ra), Node (vb, lb, rb) -> va = vb && tree_equal la lb && tree_equal ra rb
    | _ -> false

  let test_sym_cbal_trees () =
    let trees = sym_cbal_trees 5 in
    let expected_result = [
      Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
           Node ('x', Empty, Node ('x', Empty, Empty)));
      Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)),
           Node ('x', Node ('x', Empty, Empty), Empty))
    ] in
    check (testable (list (tree_pp Format.pp_print_char)) (List.equal tree_equal)) "Test Symmetric Completely Balanced Binary Trees" expected_result trees

  let test_num_sym_cbal_trees () =
    let num_trees = List.length (sym_cbal_trees 57) in
    check int "Test Number of Symmetric Trees with 57 Nodes" 256 num_trees

  let run () =
    let open Alcotest in
    run "Symmetric Completely Balanced Binary Trees" [
      "sym_cbal_trees", [
        test_case "Test Symmetric Completely Balanced Binary Trees" `Quick test_sym_cbal_trees;
        test_case "Test Number of Symmetric Trees with 57 Nodes" `Quick test_num_sym_cbal_trees;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
