open Test_lib
open Report

let exercise_slice =
  Section ([ Text "Function: "; Code "slice" ],
    test_function_3_against_solution
      [%ty: 'a list -> int -> int -> 'a list]
      "slice"
      ~gen:0
      [ (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"], 2, 6)
      ; (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"], 0, 9)
      ; (["a"; "b"; "c"; "d"], 2, 1)
      ; (["a"; "b"; "c"; "d"], 4, 5)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_slice ]
