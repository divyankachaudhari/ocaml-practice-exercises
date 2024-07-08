open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val is_symmetric : 'a binary_tree -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_empty_tree () =
    check bool "test_empty_tree" true (is_symmetric Empty)

  let test_single_node () =
    check bool "test_single_node" true (is_symmetric (Node ('x', Empty, Empty)))

  let test_symmetric_tree () =
    let tree = Node ('a', Node ('b', Empty, Empty), Node ('b', Empty, Empty)) in
    check bool "test_symmetric_tree" true (is_symmetric tree)

  let test_asymmetric_tree () =
    let tree = Node ('a', Node ('b', Empty, Empty), Empty) in
    check bool "test_asymmetric_tree" false (is_symmetric tree)

  let run () =
    let open Alcotest in
    run "Symmetric Binary Trees Tests" [
      "is_symmetric", [
        test_case "test_empty_tree" `Quick test_empty_tree;
        test_case "test_single_node" `Quick test_single_node;
        test_case "test_symmetric_tree" `Quick test_symmetric_tree;
        test_case "test_asymmetric_tree" `Quick test_asymmetric_tree;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
