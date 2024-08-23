open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val preorder : 'a binary_tree -> 'a list
  val inorder : 'a binary_tree -> 'a list
  val pre_in_tree : 'a list -> 'a list -> 'a binary_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let rec tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r
(*
  let tree_equal a b = 
    match a, b with
    | Empty, Empty -> true
    | Node (va, la, ra), Node (vb, lb, rb) -> va = vb && tree_equal la lb && tree_equal ra rb
    | _ -> false
*)
  let test_preorder_works_correctly () =
    let example_tree =
      Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
           Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty))) in
    let expected_preorder = ['a'; 'b'; 'd'; 'e'; 'c'; 'f'; 'g'] in
    check (list char) "preorder" expected_preorder (preorder example_tree)

  let test_inorder_works_correctly () =
    let example_tree =
      Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
           Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty))) in
    let expected_inorder = ['d'; 'b'; 'e'; 'a'; 'c'; 'g'; 'f'] in
    check (list char) "inorder" expected_inorder (inorder example_tree)

  let test_pre_in_tree_works_correctly () =
    let pre_seq = ['a'; 'b'; 'd'; 'e'; 'c'; 'f'; 'g'] in
    let in_seq = ['d'; 'b'; 'e'; 'a'; 'c'; 'g'; 'f'] in
    let expected_tree =
      Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
           Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty))) in
    check (of_pp (tree_pp Format.pp_print_char))
      "pre_in_tree" expected_tree (pre_in_tree pre_seq in_seq)

  let run () =
    let open Alcotest in
    run "preorder, inorder, pre_in_tree" [
      "preorder, inorder, pre_in_tree", [
        test_case "test_preorder_works_correctly" `Quick test_preorder_works_correctly;
        test_case "test_inorder_works_correctly" `Quick test_inorder_works_correctly;
        test_case "test_pre_in_tree_works_correctly" `Quick test_pre_in_tree_works_correctly;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
