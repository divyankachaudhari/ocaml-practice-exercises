open Test_lib
open Report

let exercise_pack =
  Section ([ Text "Function: "; Code "pack" ],
    test_function_1_against_solution
      [%ty: 'a list -> 'a list list]
      "pack"
      ~gen:0
      [ ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_pack ]
