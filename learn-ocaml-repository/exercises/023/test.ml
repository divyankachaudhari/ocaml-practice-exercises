open Test_lib
open Report

let exercise_rand_select =
  Section ([ Text "Function: "; Code "rand_select" ],
    test_function_2_against_solution
      [%ty: 'a list -> int -> 'a list]
      "rand_select"
      ~gen:0
      [ (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"], 3)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"], 5)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_rand_select ]
