open Alcotest

module type Testable = sig
  type 'a mult_tree = T of 'a * 'a mult_tree list
  val lispy : char mult_tree -> string
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let tree_example =
    T ('a', [T ('f', [T ('g', [])]); T ('c', []); T ('b', [T ('d', []); T ('e', [])])])

  let test_lispy_single_node () =
    let expected = "a" in
    check string "single node" expected (lispy (T ('a', [])))

  let test_lispy_simple_tree () =
    let expected = "(a b)" in
    check string "simple tree" expected (lispy (T ('a', [T ('b', [])])))

  let test_lispy_complex_tree () =
    let expected = "(a (f g) c (b d e))" in
    check string "complex tree" expected (lispy tree_example)

  let run () =
    run "Lispy Tree Representation" [
      "lispy", [
        test_case "single node" `Quick test_lispy_single_node;
        test_case "simple tree" `Quick test_lispy_simple_tree;
        test_case "complex tree" `Quick test_lispy_complex_tree;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
