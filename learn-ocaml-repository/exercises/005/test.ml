open Test_lib
open Report

let exercise_rev_int =
  Section ([ Text "Function: "; Code "rev with int list" ],
    test_function_1_against_solution
      [%ty: int list -> int list]
      "rev"
      ~gen:0
      [ []
      ; [1]
      ; [1; 2; 3]
      ; [1; 2; 3; 4; 5]
      ; [5; 4; 3; 2; 1]
      ])

let exercise_rev_string =
  Section ([ Text "Function: "; Code "rev with string list" ],
    test_function_1_against_solution
      [%ty: string list -> string list]
      "rev"
      ~gen:0
      [ []
      ; ["a"]
      ; ["a"; "b"; "c"]
      ; ["e"; "d"; "c"; "b"; "a"]
      ])

let exercise_rev_bool =
  Section ([ Text "Function: "; Code "rev with bool list" ],
    test_function_1_against_solution
      [%ty: bool list -> bool list]
      "rev"
      ~gen:0
      [ []
      ; [true]
      ; [true; false]
      ; [true; false; true; false]
      ; [false; true; false; true; false]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_rev_int
  ; exercise_rev_string
  ; exercise_rev_bool
  ]
