open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree

  val hbal_tree : int -> char binary_tree list

  val tree_height : 'a binary_tree -> int
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

  let test_hbal_tree () =
    let open Alcotest in
    run "Height-Balanced Binary Trees" [
      "hbal_tree", [
        test_case "Test Empty Tree" `Quick (fun _ ->
          let trees = hbal_tree 0 in
          let expected_trees = [Empty] in
          check (list (tree_pp Format.pp_print_char)) "Empty Tree" expected_trees trees
        );
        test_case "Test Single Node Tree" `Quick (fun _ ->
          let trees = hbal_tree 1 in
          let expected_trees = [Node ('x', Empty, Empty)] in
          check (list (tree_pp Format.pp_print_char)) "Single Node Tree" expected_trees trees
        ); 
        test_case "Test Height 2 Tree" `Quick (fun _ ->
          let trees = hbal_tree 2 in
          let expected_trees = [
            Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty));
            Node ('x', Node ('x', Empty, Empty), Empty);
            Node ('x', Empty, Node ('x', Empty, Empty))
          ] in
          check (list (tree_pp Format.pp_print_char)) "Height 2 Tree" expected_trees trees;
        );
      ]
    ]

  let test_tree_height () =
    let open Alcotest in
    run "Tree Height" [
      "tree_height", [
        test_case "Test Empty Tree" `Quick (fun _ ->
          let height = tree_height Empty in
          check int "Empty Tree" 0 height
        );
        test_case "Test Single Node Tree" `Quick (fun _ ->
          let tree = Node ('x', Empty, Empty) in
          let height = tree_height tree in
          check int "Single Node Tree" 1 height
        );
        test_case "Test Multi Node Height 3 Tree" `Quick (fun _ ->
          let tree = Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Empty, Node ('x', Empty, Empty))) in
          let height = tree_height tree in
          check int "Multi Node Height 3 Tree" 3 height
        );
        test_case "Test Different Heights Tree on both sides" `Quick (fun _ ->
          let tree = Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Node ('x', Empty, Empty))) in
          let height = tree_height tree in
          check int "Different Heights Tree" 3 height
        );
        test_case "Test Asymmetric Heights Tree" `Quick (fun _ ->
          let tree = Node ('x', Node ('x', Node ('x', Empty, Empty), Empty), Empty) in
          let height = tree_height tree in
          check int "Asymmetric Heights Tree" 3 height
        );
        test_case "Test Large Height Tree" `Quick (fun _ ->
          let tree = 
            Node ('x',
              Node ('x',
                Node ('x', Empty, Empty),
                Node ('x', Empty, Empty)
              ),
              Node ('x',
                Node ('x', Empty, Empty),
                Node ('x', Empty, Empty)
              )
            ) 
          in
          let height = tree_height tree in
          check int "Large Height Tree" 3 height
        );
        test_case "Test Random Tree" `Quick (fun _ ->
          let tree =
            Node (
              'x',
              Node (
                'x',
                Node ('x', Empty, Node ('x', Empty, Empty)),
                Node ('x', Empty, Node ('x', Empty, Empty))
              ),
              Node (
                'x',
                Node ('x', Node ('x', Empty, Empty), Node ('x', Empty, Empty)),
                Node ('x', Empty, Node ('x', Empty, Empty))
              )
            ) 
          in
          let height = tree_height tree in
          check bool "Height is greater than or equal to 0" true (height >= 0)
        );
      ]
    ]

  let run () =
    test_hbal_tree ();
    test_tree_height ()
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
