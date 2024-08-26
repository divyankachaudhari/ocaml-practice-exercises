open Test_lib
open Report

let exercise_coprime =
  Section ([ Text "Function: "; Code "coprime" ],
    test_function_2_against_solution
      [%ty: int -> int -> bool]
      "coprime"
      ~gen:0
      [ (13, 27)  (* Expected to be coprime *)
      ; (20536, 7826)  (* Expected to not be coprime *)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_coprime ]
