open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val cbal_tree : int -> char binary_tree list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r

  let trees_pp pp fmt trees =
    Format.fprintf fmt "[%a]" (Format.pp_print_list ~pp_sep:Format.pp_print_space (tree_pp pp)) trees

  let tree_equal a b = 
    match a, b with
    | Empty, Empty -> true
    | Node (va, la, ra), Node (vb, lb, rb) -> va = vb && tree_equal la lb && tree_equal ra rb
    | _ -> false

  let trees_equal a b =
    List.length a = List.length b && List.for_all2 tree_equal a b

  let test_example_test () =
    let result = cbal_tree 4 in
    let expected_result = [
      Node ('x', Node ('x', Empty, Empty), Node ('x', Node ('x', Empty, Empty), Empty));
      Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Node ('x', Empty, Empty)));
      Node ('x', Node ('x', Node ('x', Empty, Empty), Empty), Node ('x', Empty, Empty));
      Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Empty, Empty))
    ] in
    check (testable trees_pp trees_equal) "Example Test" expected_result result

  let test_empty_tree () =
    let result = cbal_tree 0 in
    let expected_result = [Empty] in
    check (testable trees_pp trees_equal) "Empty Tree Test" expected_result result

  let test_single_node () =
    let result = cbal_tree 1 in
    let expected_result = [Node ('x', Empty, Empty)] in
    check (testable trees_pp trees_equal) "Single Node Test" expected_result result

  let test_multi_nodes () =
    let result = cbal_tree 3 in
    let expected_result = [
      Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty))
    ] in
    check (testable trees_pp trees_equal) "Multi Nodes Test" expected_result result

  let run () =
    let open Alcotest in
    run "Completely Balanced Binary Trees" [
      "cbal_tree", [
        test_case "Example Test" `Quick test_example_test;
        test_case "Empty Tree Test" `Quick test_empty_tree;
        test_case "Single Node Test" `Quick test_single_node;
        test_case "Multi Nodes Test" `Quick test_multi_nodes;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
