open Test_lib
open Report

let exercise_table2 =
  Section ([ Text "Function: "; Code "table2" ],
    test_function_3_against_solution
      [%ty: string -> string -> bool_expr -> (bool * bool * bool) list]
      "table2"
      ~gen:0
      [
        ("a", "b", And (Var "a", Or (Var "a", Var "b")));
        ("a", "b", Or (Var "a", And (Var "a", Var "b")));
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_table2 ]
