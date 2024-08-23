open Test_lib
open Report

let exercise_encode_rle =
  Section ([ Text "Function: "; Code "encode" ],
    test_function_1_against_solution
      [%ty: 'a list -> 'a rle list]
      "encode"
      ~gen:0
      [ ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
      ; []
      ])

let () =
  set_result @@
  ast_sanity_check ~modules:["Solution"] code_ast @@ fun () ->
  [ exercise_encode_rle ]
