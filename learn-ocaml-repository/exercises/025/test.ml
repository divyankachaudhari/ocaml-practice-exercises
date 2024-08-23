open Test_lib
open Report

let exercise_permutation =
  Section ([ Text "Function: "; Code "permutation" ],
    test_function_1_against_solution
      [%ty: 'a list -> 'a list]
      "permutation"
      ~gen:0
      [ []
      ; ["a"; "b"; "c"; "d"; "e"; "f"]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_permutation ]
