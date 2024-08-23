open Test_lib
open Report

let exercise_drop =
  Section ([ Text "Function: "; Code "drop" ],
    test_function_2_against_solution
      [%ty: 'a list -> int -> 'a list]
      "drop"
      ~gen:0
      [ (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"], 3)
      ; ([], 3)
      ; (["a"; "b"], 3)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"], 0)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"], 1)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_drop ]
