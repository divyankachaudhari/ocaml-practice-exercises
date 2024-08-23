open Alcotest

module type Testable = sig
  type 'a mult_tree = T of 'a * 'a mult_tree list
  val ipl : 'a mult_tree -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_single_node_tree () =
    let tree = T ('a', []) in
    check int "internal path length of single node tree" 0 (ipl tree)

  let test_multi_node_tree () =
    let tree = T ('a', [T ('f', [T ('g', [])]); T ('c', []); T ('b', [T ('d', []); T ('e', [])])]) in
    check int "internal path length of multi-node tree" 9 (ipl tree)

  let test_complex_tree () =
    let tree = T ('a', [T ('b', [T ('c', [T ('d', [])])])]) in
    check int "internal path length of complex tree" 6 (ipl tree)

  let run () =
    run "Internal Path Length of Multiway Tree" [
      "ipl", [
        test_case "single node tree" `Quick test_single_node_tree;
        test_case "multi-node tree" `Quick test_multi_node_tree;
        test_case "complex tree" `Quick test_complex_tree;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
