open Test_lib
open Report

(* Function to be tested *)
let rec at k = function
  | [] -> None
  | h :: t -> if k = 0 then Some h else at (k - 1) t

(* Test for at function with int list *)
let exercise_at_int =
  Section ([ Text "Function: "; Code "at with int list" ],
    test_function_2_against_solution
      [%ty: int -> int list -> int option]
      "at"
      ~gen:0
      [ (0, [1; 2; 3])
      ; (1, [1; 2; 3])
      ; (2, [1; 2; 3])
      ; (3, [1; 2; 3])
      ; (0, [])
      ; (1, [1])
      ])

(* Test for at function with string list *)
let exercise_at_string =
  Section ([ Text "Function: "; Code "at with string list" ],
    test_function_2_against_solution
      [%ty: int -> string list -> string option]
      "at"
      ~gen:0
      [ (0, ["a"; "b"; "c"; "d"; "e"])
      ; (2, ["a"; "b"; "c"; "d"; "e"])
      ; (4, ["a"; "b"; "c"; "d"; "e"])
      ; (5, ["a"; "b"; "c"; "d"; "e"])
      ; (0, [])
      ; (1, ["a"])
      ])

(* Test for at function with bool list *)
let exercise_at_bool =
  Section ([ Text "Function: "; Code "at with bool list" ],
    test_function_2_against_solution
      [%ty: int -> bool list -> bool option]
      "at"
      ~gen:0
      [ (0, [true; false; true])
      ; (1, [true; false; true])
      ; (2, [true; false; true])
      ; (3, [true; false; true])
      ; (0, [])
      ; (1, [true])
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_at_int
  ; exercise_at_string
  ; exercise_at_bool
  ]
