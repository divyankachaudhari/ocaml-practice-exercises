open OUnit2

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val is_symmetric : 'a binary_tree -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let example_tests = "Symmetric Binary Trees" >::: [
    "test_empty_tree" >:: (fun _ ->
      assert_equal true (is_symmetric Empty)
    );

    "test_single_node" >:: (fun _ ->
      assert_equal true (is_symmetric (Node ('x', Empty, Empty)))
    );

    "test_symmetric_tree" >:: (fun _ ->
      let tree = Node ('a', Node ('b', Empty, Empty), Node ('b', Empty, Empty)) in
      assert_equal true (is_symmetric tree)
    );

    "test_asymmetric_tree" >:: (fun _ ->
      let tree = Node ('a', Node ('b', Empty, Empty), Empty) in
      assert_equal false (is_symmetric tree)
    );

  ]

  let v = "Symmetric Binary Trees Tests" >::: [example_tests]
end
  let run () = OUnit2.run_test_tt_main v


module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
