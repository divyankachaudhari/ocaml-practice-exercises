module Test = struct
  (* Helper function to convert list to string for printing. *)
  let list_to_string convert lst =
    "[" ^ (String.concat "; " (List.map convert lst)) ^ "]"

  (* Function to assert equality of 'a list types, and print result. *)
  let assert_equal expected actual =
    if expected = actual then
      Printf.printf "✓ Test passed\n"
    else
      Printf.printf "✗ Test failed\nExpected: %s\nGot: %s\n"
        (list_to_string string_of_int expected)
        (list_to_string string_of_int actual)

  (* Run all tests. *)
  let run_tests () =
    print_endline "--------------------------------------";
    print_endline "Running Duplicate Elements Tests:";
    print_endline "Test: Non-empty list";
    assert_equal [1; 1; 2; 2; 3; 3; 3; 3; 4; 4] (duplicate [1; 2; 3; 3; 4]);
    print_endline "Test: Empty list";
    assert_equal [] (duplicate []);
    print_endline "All tests completed."
end

(* Execute the tests and suppress any final output from this cell *)
let () = Test.run_tests ();;

