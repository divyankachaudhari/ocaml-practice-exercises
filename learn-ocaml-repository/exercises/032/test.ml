open Test_lib
open Report

let exercise_gcd =
  Section ([ Text "Function: "; Code "gcd" ],
    test_function_2_against_solution
      [%ty: int -> int -> int]
      "gcd"
      ~gen:0
      [ (13, 0)
      ; (20536, 7826)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_gcd ]
