open Test_lib
open Report

let exercise_goldbach_list =
  Section ([ Text "Function: "; Code "goldbach_list" ],
    test_function_2_against_solution
      [%ty: int -> int -> (int * (int * int)) list]
      "goldbach_list"
      ~gen:0
      [
        (9, 20)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_goldbach_list ]
