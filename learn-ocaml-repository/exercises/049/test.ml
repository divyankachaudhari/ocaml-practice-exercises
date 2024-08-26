open Test_lib
open Report

let exercise_gray =
  Section ([ Text "Function: "; Code "gray" ],
    test_function_1_against_solution
      [%ty: int -> string list]
      "gray"
      ~gen:0
      [
        1;  (* Expected result: ["0"; "1"] *)
        2;  (* Expected result: ["00"; "01"; "11"; "10"] *)
        3   (* Expected result: ["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"] *)
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_gray ]
