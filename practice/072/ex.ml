open Alcotest

module type Testable = sig
  type 'a mult_tree = T of 'a * 'a mult_tree list
  val bottom_up : 'a mult_tree -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_bottom_up_single_node () =
    let t = T ('a', [T ('b', [])]) in
    check (list char) "bottom_up single node" ['b'; 'a'] (bottom_up t)

  let test_bottom_up_complex_tree () =
    let t = T ('a', [T ('f', [T ('g', [])]); T ('c', []);
                      T ('b', [T ('d', []); T ('e', [])])]) in
    check (list char) "bottom_up complex tree" ['g'; 'f'; 'c'; 'd'; 'e'; 'b'; 'a'] (bottom_up t)

  let run () =
    let open Alcotest in
    run "Bottom-Up Order Sequence of the Tree Nodes" [
      "bottom_up", [
        test_case "test_bottom_up_single_node" `Quick test_bottom_up_single_node;
        test_case "test_bottom_up_complex_tree" `Quick test_bottom_up_complex_tree;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
