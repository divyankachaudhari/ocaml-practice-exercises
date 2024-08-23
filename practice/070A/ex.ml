open Alcotest

module type Testable = sig
  type 'a mult_tree = T of 'a * 'a mult_tree list
  val string_of_tree : char mult_tree -> string
  val tree_of_string : string -> char mult_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  (* Sample tree and corresponding string representation *)
  let example_tree = 
    T ('a', [
      T ('f', [T ('g', [])]); 
      T ('c', []); 
      T ('b', [T ('d', []); T ('e', [])])
    ])

  let example_string = "afg^^c^bd^e^^^"

  (* Helper functions for comparing trees *)
  let rec tree_equal (T (a1, l1)) (T (a2, l2)) =
    a1 = a2 && List.for_all2 tree_equal l1 l2

  let tree_pp fmt (T (v, _)) = Format.fprintf fmt "T (%c, _)" v

  (* Test cases *)
  let test_string_of_tree () =
    let result = string_of_tree example_tree in
    check string "string_of_tree" example_string result

  let test_tree_of_string () =
    let result = tree_of_string example_string in
    check (testable tree_pp tree_equal) "tree_of_string" example_tree result

  let test_round_trip () =
    let result = tree_of_string (string_of_tree example_tree) in
    check (testable tree_pp tree_equal) "round trip" example_tree result

  let run () =
    run "Tree Construction From a Node String" [
      "string_of_tree", [
        test_case "convert tree to string" `Quick test_string_of_tree;
        test_case "convert string to tree" `Quick test_tree_of_string;
        test_case "round trip conversion" `Quick test_round_trip;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
