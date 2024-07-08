open Test_lib
open Report

let exercise_last_int =
  Section ([ Text "Function: "; Code "last with int list" ],
    test_function_1_against_solution
      [%ty: int list -> int option]
      "last"
      ~gen:0
      [ []
      ; [1]
      ; [1; 2; 3]
      ])

let exercise_last_string =
  Section ([ Text "Function: "; Code "last with string list" ],
    test_function_1_against_solution
      [%ty: string list -> string option]
      "last"
      ~gen:0
      [ []
      ; ["a"]
      ; ["a"; "b"; "c"]
      ])

let exercise_last_bool =
  Section ([ Text "Function: "; Code "last with bool list" ],
    test_function_1_against_solution
      [%ty: bool list -> bool option]
      "last"
      ~gen:0
      [ []
      ; [true]
      ; [true; false; true]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_last_int
  ; exercise_last_string
  ; exercise_last_bool
  ]
