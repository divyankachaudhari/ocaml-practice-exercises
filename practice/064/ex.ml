open Alcotest

module type Testable = sig
  type 'a binary_tree = 
    | Empty 
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val layout_binary_tree_1 : 'a binary_tree -> ('a * int * int) binary_tree
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let rec tree_pp pp fmt = function
    | Empty -> Format.fprintf fmt "Empty"
    | Node (v, l, r) -> Format.fprintf fmt "Node (%a, %a, %a)" pp v (tree_pp pp) l (tree_pp pp) r
(*
  let tree_equal a b = 
    match a, b with
    | Empty, Empty -> true
    | Node (va, la, ra), Node (vb, lb, rb) -> va = vb && tree_equal la lb && tree_equal ra rb
    | _ -> false
*)
  let test_empty_tree () =
    check (of_pp (tree_pp (fun fmt (v, x, y) -> Format.fprintf fmt "('%c', %d, %d)" v x y))) "empty_tree" Empty (layout_binary_tree_1 Empty)

  let test_example_tree () =
    let expected_layout =
      Node (('n', 8, 1),
            Node (('k', 6, 2),
                  Node (('c', 2, 3),
                        Node (('a', 1, 4), Empty, Empty),
                        Node (('h', 5, 4),
                              Node (('g', 4, 5),
                                    Node (('e', 3, 6), Empty, Empty), Empty), Empty)),
                  Node (('m', 7, 3), Empty, Empty)),
            Node (('u', 12, 2),
                  Node (('p', 9, 3), Empty,
                        Node (('s', 11, 4),
                              Node (('q', 10, 5), Empty, Empty), Empty)),
                  Empty))
    in
    let example_layout_tree =
      let leaf x = Node (x, Empty, Empty) in
      Node ('n', Node ('k', Node ('c', leaf 'a',
                                   Node ('h', Node ('g', leaf 'e', Empty), Empty)),
                        leaf 'm'),
            Node ('u', Node ('p', Empty, Node ('s', leaf 'q', Empty)), Empty))
    in
    check (of_pp (tree_pp (fun fmt (v, x, y) -> Format.fprintf fmt "('%c', %d, %d)" v x y)))
      "example_tree" expected_layout (layout_binary_tree_1 example_layout_tree)

  let run () =
    let open Alcotest in
    run "layout_binary_tree_1" [
      "layout_binary_tree_1", [
        test_case "empty_tree" `Quick test_empty_tree;
        test_case "example_tree" `Quick test_example_tree;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
