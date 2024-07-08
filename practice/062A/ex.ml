open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val internals : 'a binary_tree -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_empty_tree () =
    check (list char) "empty_tree" [] (Tested.internals Empty)

  let test_one_internal () =
    check (list char) "one_internal" [] (Tested.internals (Node('a', Empty, Empty)))

  let test_two_internals () =
    check (list char) "two_internals" ['a'] (Tested.internals (Node('a', Node('b', Empty, Empty), Empty)))

  let test_three_internals () =
    check (list char) "three_internals" ['a'] (Tested.internals (Node('a', Node('b', Node('c', Empty, Empty), Empty), Empty)))

  let run () =
    let open Alcotest in
    run "internals" [
      "internals", [
        test_case "empty_tree" `Quick test_empty_tree;
        test_case "one_internal" `Quick test_one_internal;
        test_case "two_internals" `Quick test_two_internals;
        test_case "three_internals" `Quick test_three_internals;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
