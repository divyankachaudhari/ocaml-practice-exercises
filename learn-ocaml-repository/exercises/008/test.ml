open Test_lib
open Report

let exercise_compress_int =
  Section ([ Text "Function: "; Code "compress with int list" ],
    test_function_1_against_solution
      [%ty: int list -> int list]
      "compress"
      ~gen:0
      [ []
      ; [1]
      ; [1; 1; 2; 2; 3; 3; 3; 4; 4; 5]
      ; [1; 2; 3; 4; 5]
      ; [1; 1; 1; 1; 1]
      ])

let exercise_compress_string =
  Section ([ Text "Function: "; Code "compress with string list" ],
    test_function_1_against_solution
      [%ty: string list -> string list]
      "compress"
      ~gen:0
      [ []
      ; ["a"]
      ; ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "d"; "d"; "e"]
      ; ["a"; "b"; "c"; "d"; "e"]
      ; ["a"; "a"; "a"; "a"; "a"]
      ; ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
      ])

let exercise_compress_bool =
  Section ([ Text "Function: "; Code "compress with bool list" ],
    test_function_1_against_solution
      [%ty: bool list -> bool list]
      "compress"
      ~gen:0
      [ []
      ; [true]
      ; [true; true; false; false; true; true; true; false; false; true]
      ; [true; false; true; false]
      ; [true; true; true; true; true]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_compress_int
  ; exercise_compress_string
  ; exercise_compress_bool
  ]
