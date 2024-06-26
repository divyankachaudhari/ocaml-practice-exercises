open OUnit2

module type Testable = sig
  type 'a binary_tree = | Empty | Node of 'a * 'a binary_tree * 'a binary_tree
  val layout_binary_tree_3 : 'a binary_tree -> ('a * int * int) binary_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested
  
  let v = "layout_binary_tree_3" >::: [
    "test_layout_binary_tree_3_works_correctly" >:: (fun _ ->
        let example_layout_tree =
          Node ('a', Node ('b', Empty, Empty), Node ('c', Empty, Empty)) in
        let expected_layout =
          Node (('a', 2, 1), Node (('b', 1, 2), Empty, Empty), Node (('c', 3, 2), Empty, Empty)) in
        assert_equal expected_layout (layout_binary_tree_3 example_layout_tree));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
