open Alcotest

module type Testable = sig
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
  val hbal_tree_nodes : int -> char binary_tree list
  val min_nodes : int -> int
  val max_nodes : int -> int
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
  let test_hbal_tree_nodes () =
    let test_height_1 () =
      let trees = hbal_tree_nodes 1 in
      let expected_result = [Node ('x', Empty, Empty)] in
      check (list (of_pp (tree_pp Format.pp_print_char))) "Height 1" expected_result trees
    in

    let test_height_2 () =
      let trees = hbal_tree_nodes 2 in
      let expected_result = [
        Node ('x', Node ('x', Empty, Empty), Empty);
        Node ('x', Empty, Node ('x', Empty, Empty))
      ] in
      check (list (of_pp (tree_pp Format.pp_print_char))) "Height 2" expected_result trees
    in

    let test_height_0 () =
      let trees = hbal_tree_nodes 0 in
      let expected_result = [Empty] in
      check (list (of_pp (tree_pp Format.pp_print_char))) "Height 0" expected_result trees
    in

    [
      test_case "Test Height-Balanced Trees for Height 1" `Quick test_height_1;
      test_case "Test Height-Balanced Trees for Height 2" `Quick test_height_2;
      test_case "Test Height-Balanced Trees for Height 0" `Quick test_height_0;
    ]

  let test_min_nodes () =
    let test_cases = [
      (0, 0); (1, 1); (2, 2); (3, 4);
    ] in

    List.map (fun (h, expected) ->
      test_case (Printf.sprintf "Test for h = %d" h) `Quick (fun _ ->
        check int (Printf.sprintf "min_nodes %d" h) expected (min_nodes h)
      )
    ) test_cases

  let test_max_nodes () =
    let test_cases = [
      (0, 0); (1, 1); (2, 3); (3, 7); (5, 31); (6, 63);
    ] in

    let boundary_tests = [
      test_case "Boundary Case h = 31" `Quick (fun _ ->
        check int "max_nodes 31" 2147483647 (max_nodes 31)
      );
      test_case "Boundary Test h = 32" `Quick (fun _ ->
        check_raises "max_nodes 32" (Invalid_argument "max_nodes") (fun () -> ignore (max_nodes 32))
      );
      test_case "Boundary Test for large input" `Quick (fun _ ->
        check_raises "max_nodes max_int" (Invalid_argument "max_nodes") (fun () -> ignore (max_nodes max_int))
      );
    ] in

    List.map (fun (h, expected) ->
      test_case (Printf.sprintf "Test for h = %d" h) `Quick (fun _ ->
        check int (Printf.sprintf "max_nodes %d" h) expected (max_nodes h)
      )
    ) test_cases @ boundary_tests

  let run () =
    let open Alcotest in
    run "Height-Balanced Binary Trees" [
      "hbal_tree_nodes", test_hbal_tree_nodes ();
      "min_nodes", test_min_nodes ();
      "max_nodes", test_max_nodes ();
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
