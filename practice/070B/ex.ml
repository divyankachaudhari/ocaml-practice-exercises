open Alcotest

module type Testable = sig
  type 'a mult_tree = T of 'a * 'a mult_tree list
  val count_nodes : 'a mult_tree -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_count_single_node () =
    let tree = T ('a', []) in
    check int "count_nodes with single node" 1 (count_nodes tree)

  let test_count_multiple_nodes () =
    let tree = T ('a', [T ('f', [])]) in
    check int "count_nodes with multiple nodes" 2 (count_nodes tree)

  let test_count_complex_tree () =
    let tree = T ('a', [T ('f', []); T ('b', [T ('c', []); T ('d', [])])]) in
    check int "count_nodes with complex tree" 5 (count_nodes tree)

  let run () =
    run "Multiway Tree Node Count" [
      "count_nodes", [
        test_case "single node" `Quick test_count_single_node;
        test_case "multiple nodes" `Quick test_count_multiple_nodes;
        test_case "complex tree" `Quick test_count_complex_tree;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
