open Test_lib
open Report

(* Test for last_two function with int list *)
let exercise_last_two_int =
  Section ([ Text "Function: "; Code "last_two with int list" ],
    test_function_1_against_solution
      [%ty: int list -> (int * int) option]
      "last_two"
      ~gen:0
      [ []
      ; [1]
      ; [1; 2]
      ; [1; 2; 3]
      ; [1; 2; 3; 4; 5]
      ])

(* Test for last_two function with string list *)
let exercise_last_two_string =
  Section ([ Text "Function: "; Code "last_two with string list" ],
    test_function_1_against_solution
      [%ty: string list -> (string * string) option]
      "last_two"
      ~gen:0
      [ []
      ; ["a"]
      ; ["a"; "b"]
      ; ["a"; "b"; "c"]
      ; ["a"; "b"; "c"; "d"; "e"]
      ])

(* Test for last_two function with bool list *)
let exercise_last_two_bool =
  Section ([ Text "Function: "; Code "last_two with bool list" ],
    test_function_1_against_solution
      [%ty: bool list -> (bool * bool) option]
      "last_two"
      ~gen:0
      [ []
      ; [true]
      ; [true; false]
      ; [true; false; true]
      ; [true; false; true; false; true]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_last_two_int
  ; exercise_last_two_string
  ; exercise_last_two_bool
  ]
