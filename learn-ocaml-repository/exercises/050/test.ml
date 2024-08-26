open Test_lib
open Report

let exercise_huffman =
  Section ([ Text "Function: "; Code "huffman" ],
    test_function_1_against_solution
      [%ty: (string * int) list -> (string * string) list]
      "huffman"
      ~gen:0
      [
        [("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5)]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_huffman ]
