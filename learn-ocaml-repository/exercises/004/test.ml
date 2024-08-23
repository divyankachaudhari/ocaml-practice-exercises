open Test_lib
open Report

let exercise_length_int =
  Section ([ Text "Function: "; Code "length with int list" ],
    test_function_1_against_solution
      [%ty: int list -> int]
      "length"
      ~gen:0
      [ []
      ; [1]
      ; [1; 2; 3]
      ; [1; 2; 3; 4; 5]
      ; [1; 1; 1; 1; 1; 1; 1; 1; 1; 1]
      ])

let exercise_length_string =
  Section ([ Text "Function: "; Code "length with string list" ],
    test_function_1_against_solution
      [%ty: string list -> int]
      "length"
      ~gen:0
      [ []
      ; ["a"]
      ; ["a"; "b"; "c"]
      ; ["a"; "b"; "c"; "d"; "e"]
      ; ["a"; "a"; "a"; "a"; "a"; "a"; "a"; "a"; "a"; "a"]
      ])

let exercise_length_bool =
  Section ([ Text "Function: "; Code "length with bool list" ],
    test_function_1_against_solution
      [%ty: bool list -> int]
      "length"
      ~gen:0
      [ []
      ; [true]
      ; [true; false]
      ; [true; false; true; false]
      ; [true; true; true; true; true; true; true; true; true; true]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_length_int
  ; exercise_length_string
  ; exercise_length_bool
  ]
