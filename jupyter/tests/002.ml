
module Test = struct
  (* Helper function to convert list to string for printing. *)
  let list_to_string convert lst =
    "[" ^ (String.concat "; " (List.map convert lst)) ^ "]"

  (* Helper function to convert option to string for printing. *)
  let option_to_string convert opt =
    match opt with
    | None -> "None"
    | Some v -> "Some " ^ convert v

  (* Function to assert equality of 'a option types, and print result. *)
  let assert_equal expected actual =
    if expected = actual then
      Printf.printf "✓ Test passed\n"
    else
      Printf.printf "✗ Test failed\nExpected: %s\nGot: %s\n"
        (option_to_string string_of_int expected)
        (option_to_string string_of_int actual)

  (* Run all tests. *)
  let run_tests () =
    print_endline "--------------------------------------";
    print_endline "Running Exercise 002 Tests:";
    
    print_endline "Test: Exercise 002 case 1";
    assert_equal (Some ("c", "d")) (last_two ["a"; "b"; "c"; "d"]);
        
    print_endline "All tests completed."
end

(* Execute the tests and suppress any final output from this cell *)
let () = Test.run_tests ();;
    