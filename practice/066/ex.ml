open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val layout_binary_tree_3 : 'a binary_tree -> ('a * int * int) binary_tree
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
  let test_layout_binary_tree_3_works_correctly () =
    let example_layout_tree =
      Node ('a', Node ('b', Empty, Empty), Node ('c', Empty, Empty)) in
    let expected_layout =
      Node (('a', 2, 1), Node (('b', 1, 2), Empty, Empty), Node (('c', 3, 2), Empty, Empty)) in
    check (of_pp (tree_pp (fun fmt (v, x, y) -> Format.fprintf fmt "('%c', %d, %d)" v x y)))
      "test_layout_binary_tree_3_works_correctly" expected_layout (layout_binary_tree_3 example_layout_tree)

  let run () =
    let open Alcotest in
    run "layout_binary_tree_3" [
      "layout_binary_tree_3", [
        test_case "test_layout_binary_tree_3_works_correctly" `Quick test_layout_binary_tree_3_works_correctly;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
