open Test_lib
open Report

let exercise_split =
  Section ([ Text "Function: "; Code "split" ],
    test_function_2_against_solution
      [%ty: 'a list -> int -> 'a list * 'a list]
      "split"
      ~gen:0
      [ (["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"], 3)
      ; (["a"; "b"; "c"; "d"], 5)
      ; ([], 3)
      ; (["a"; "b"; "c"; "d"], 0)
      ; (["a"; "b"; "c"; "d"], 4)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_split ]
