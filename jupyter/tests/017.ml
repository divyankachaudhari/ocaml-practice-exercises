
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
    print_endline "Running Exercise 017 Tests:";
    
    print_endline "Test: Exercise 017 case 1";
    assert_equal (["a", "b", "c"], ["d", "e", "f", "g", "h", "i", "j"]) (split ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3);
        

    print_endline "Test: Exercise 017 case 2";
    assert_equal (["a", "b", "c", "d"], []) (split ["a"; "b"; "c"; "d"] 5);
        

    print_endline "Test: Exercise 017 case 3";
    assert_equal ([], []) (split [] 3);
        

    print_endline "Test: Exercise 017 case 4";
    assert_equal ([], ["a", "b", "c", "d"]) (split ["a"; "b"; "c"; "d"] 0);
        
    print_endline "All tests completed."
end

(* Execute the tests and suppress any final output from this cell *)
let () = Test.run_tests ();;
    