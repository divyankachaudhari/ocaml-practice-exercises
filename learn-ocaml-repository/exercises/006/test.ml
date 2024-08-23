open Test_lib
open Report

let exercise_is_palindrome =
  Section ([ Text "Function: "; Code "is_palindrome" ],
    test_function_1_against_solution
      [%ty: 'a list -> bool]
      "is_palindrome"
      ~gen:0
      [ ["x"; "a"; "m"; "a"; "x"]
      ; ["a"; "b"]
      ; []
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_is_palindrome ]
