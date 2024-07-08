open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val at_level : 'a binary_tree -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested
  
  let example_tree =
    Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)),
         Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))

  let test_empty_tree () =
    check (list char) "empty_tree" [] (at_level Empty 1)

  let test_level_1_single_node () =
    check (list char) "level_1_single_node" ['a'] (at_level example_tree 1)

  let test_level_2_two_nodes () =
    check (list char) "level_2_two_nodes" ['b'; 'c'] (at_level example_tree 2)

  let test_level_3_four_nodes () =
    check (list char) "level_3_four_nodes" ['d'; 'e'; 'f'] (at_level example_tree 3)

  let run () =
    let open Alcotest in
    run "at_level" [
      "at_level", [
        test_case "empty_tree" `Quick test_empty_tree;
        test_case "level_1_single_node" `Quick test_level_1_single_node;
        test_case "level_2_two_nodes" `Quick test_level_2_two_nodes;
        test_case "level_3_four_nodes" `Quick test_level_3_four_nodes;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
