open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val complete_binary_tree : 'a list -> 'a binary_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let rec tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r

  let test_empty_list () =
    check (of_pp (tree_pp (fun fmt -> Format.fprintf fmt "%i")))
      "empty_list" Empty (complete_binary_tree [])

  let test_single_node () =
    let result = complete_binary_tree [1] in
    check (of_pp (tree_pp (fun fmt -> Format.fprintf fmt "%i")))
      "single_node" (Node(1, Empty, Empty)) result

  let test_small_list () =
    let result = complete_binary_tree [1; 2; 3] in
    let expected_tree = Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty)) in
    check (of_pp (tree_pp (fun fmt -> Format.fprintf fmt "%i")))
      "small_list" expected_tree result

  let test_larger_list () =
    let result = complete_binary_tree [1; 2; 3; 4; 5; 6] in
    let expected_tree =
      Node(1,
        Node(2, Node(4, Empty, Empty), Node(5, Empty, Empty)),
        Node(3, Node(6, Empty, Empty), Empty))
    in
    check (of_pp (tree_pp (fun fmt -> Format.fprintf fmt "%i")))
      "larger_list" expected_tree result

  let run () =
    let open Alcotest in
    run "complete_binary_tree" [
      "complete_binary_tree", [
        test_case "empty_list" `Quick test_empty_list;
        test_case "single_node" `Quick test_single_node;
        test_case "small_list" `Quick test_small_list;
        test_case "larger_list" `Quick test_larger_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
