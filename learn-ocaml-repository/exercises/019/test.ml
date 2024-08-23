open Test_lib
open Report

let exercise_rotate =
  Section ([ Text "Function: "; Code "rotate" ],
    test_function_2_against_solution
      [%ty: 'a list -> int -> 'a list]
      "rotate"
      ~gen:0
      [ (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"], 3)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"], -5)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"], 11)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"], 0)
      ; ([], 3)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_rotate ]
