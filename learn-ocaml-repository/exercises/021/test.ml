open Test_lib
open Report

let exercise_insert_at =
  Section ([ Text "Function: "; Code "insert_at" ],
    test_function_3_against_solution
      [%ty: 'a -> int -> 'a list -> 'a list]
      "insert_at"
      ~gen:0
      [ ("alpha", 1, ["a"; "b"; "c"; "d"])
      ; ("beta", 0, ["a"; "b"; "c"; "d"])
      ; ("alpha", 4, ["a"; "b"; "c"; "d"])
      ; ("beta", 6, ["a"; "b"; "c"; "d"])
      ; ("alpha", 0, [])
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_insert_at ]
