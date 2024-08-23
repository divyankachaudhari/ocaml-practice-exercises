open Test_lib
open Report

let exercise_replicate =
  Section ([ Text "Function: "; Code "replicate" ],
    test_function_2_against_solution
      [%ty: 'a list -> int -> 'a list]
      "replicate"
      ~gen:0
      [ (["a"; "b"; "c"], 3)
      ; ([], 3)
      ; (["a"; "b"; "c"], 0)
      ; (["a"; "b"; "c"], 1)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_replicate ]
