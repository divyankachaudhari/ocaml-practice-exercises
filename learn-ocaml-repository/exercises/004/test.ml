open Test_lib
open Report

(* Function to be tested *)
let length list =
  let rec aux n = function
    | [] -> n
    | _ :: t -> aux (n + 1) t
  in
  aux 0 list

(* Test for length function with int list *)
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

(* Test for length function with string list *)
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

(* Test for length function with bool list *)
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
