open Test_lib
open Report

type 'a node =
  | One of 'a
  | Many of 'a node list

(* Test for flatten function with int list *)
let exercise_flatten_int =
  Section ([ Text "Function: "; Code "flatten with int list" ],
    test_function_1_against_solution
      [%ty: int node list -> int list]
      "flatten"
      ~gen:0
      [ [One 1; Many [One 2; One 3]; One 4]
      ; []
      ; [Many [One 1; Many [One 2; One 3]]]
      ])

(* Test for flatten function with string list *)
let exercise_flatten_string =
  Section ([ Text "Function: "; Code "flatten with string list" ],
    test_function_1_against_solution
      [%ty: string node list -> string list]
      "flatten"
      ~gen:0
      [ [One "a"; Many [One "b"; One "c"]; One "d"]
      ; []
      ; [Many [One "a"; Many [One "b"; One "c"]]]
      ; [One "a"; Many [One "b"; Many [One "c"; One "d"]; One "e"]]
      ])

(* Test for flatten function with bool list *)
let exercise_flatten_bool =
  Section ([ Text "Function: "; Code "flatten with bool list" ],
    test_function_1_against_solution
      [%ty: bool node list -> bool list]
      "flatten"
      ~gen:0
      [ [One true; Many [One false; One true]]
      ; []
      ; [Many [One true; Many [One false; One true]]]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_flatten_int
  ; exercise_flatten_string
  ; exercise_flatten_bool
  ]
