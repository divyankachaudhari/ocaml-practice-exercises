open Test_lib
open Report

let exercise_remove_at =
  Section ([ Text "Function: "; Code "remove_at" ],
    test_function_2_against_solution
      [%ty: int -> 'a list -> 'a list]
      "remove_at"
      ~gen:0
      [ (1, ["a"; "b"; "c"; "d"])
      ; (4, ["a"; "b"; "c"; "d"])
      ; (1, [])
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_remove_at ]
