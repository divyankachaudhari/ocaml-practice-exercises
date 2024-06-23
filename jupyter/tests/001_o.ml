(* test_last.ml *)
open OUnit2

(* Test cases *)
let test_last_empty _ =
  assert_equal None (last [])

let test_last_single_element _ =
  assert_equal (Some 1) (last [1])

let test_last_multiple_elements _ =
  assert_equal (Some 3) (last [1; 2; 3])

let test_last_multiple_elements_strings _ =
  assert_equal (Some "c") (last ["a"; "b"; "c"])

(* Test suite *)
let suite =
  "last_tests" >::: [
    "test_last_empty" >:: test_last_empty;
    "test_last_single_element" >:: test_last_single_element;
    "test_last_multiple_elements" >:: test_last_multiple_elements;
    "test_last_multiple_elements_strings" >:: test_last_multiple_elements_strings;
  ]

(* Run the tests *)
let () =
  run_test_tt_main suite
