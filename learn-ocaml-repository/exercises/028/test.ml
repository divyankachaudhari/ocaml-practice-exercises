open Test_lib
open Report

let exercise_length_sort =
  Section ([ Text "Function: "; Code "length_sort" ],
    test_function_1_against_solution
      [%ty: 'a list list -> 'a list list]
      "length_sort"
      ~gen:0
      [ [[]]
      ; [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"]; ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]]
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_length_sort ]
