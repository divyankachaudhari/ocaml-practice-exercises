open Test_lib
open Report

let exercise_table =
  Section ([ Text "Function: "; Code "table" ],
    test_function_2_against_solution
      [%ty: string list -> bool_expr -> ((string * bool) list * bool) list]
      "table"
      ~gen:0
      [
        ( ["a"; "b"], And (Var "a", Or (Var "a", Var "b")) )
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_table ]
