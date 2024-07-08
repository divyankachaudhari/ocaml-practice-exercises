open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val string_of_tree : char binary_tree -> string
  val tree_of_string : string -> char binary_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r

  let tree_equal a b = 
    match a, b with
    | Empty, Empty -> true
    | Node (va, la, ra), Node (vb, lb, rb) -> va = vb && tree_equal la lb && tree_equal ra rb
    | _ -> false

  let test_string_of_tree () =
    let example_tree =
      Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)), Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))
    in
    check string "string_of_tree" "a(b(d,e),c(,f(g,)))" (string_of_tree example_tree)

  let test_tree_of_string () =
    let example_string = "a(b(d,e),c(,f(g,)))" in
    let expected_tree =
      Node ('a', Node ('b', Node ('d', Empty, Empty), Node ('e', Empty, Empty)), Node ('c', Empty, Node ('f', Node ('g', Empty, Empty), Empty)))
    in
    check (testable (tree_pp Format.pp_print_char) tree_equal)
      "tree_of_string" expected_tree (tree_of_string example_string)

  let run () =
    let open Alcotest in
    run "string_of_tree and tree_of_string" [
      "string_of_tree and tree_of_string", [
        test_case "test_string_of_tree" `Quick test_string_of_tree;
        test_case "test_tree_of_string" `Quick test_tree_of_string;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
