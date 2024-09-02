open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val count_leaves : 'a binary_tree -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_empty_tree () =
    check int "empty_tree" 0 (count_leaves Empty)

  let test_single_leaf () =
    check int "single_leaf" 1 (count_leaves (Node(1, Empty, Empty)))

  let test_two_leaves () =
    check int "two_leaves" 2 (count_leaves (Node(1, Node(2, Empty, Empty), Node(2, Empty, Empty))))

  let test_three_leaves () =
    check int "three_leaves" 2 (count_leaves (Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty))))

  let run () =
    let open Alcotest in
    run "count_leaves" [
      "count_leaves", [
        test_case "empty_tree" `Quick test_empty_tree;
        test_case "single_leaf" `Quick test_single_leaf;
        test_case "two_leaves" `Quick test_two_leaves;
        test_case "three_leaves" `Quick test_three_leaves;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
