module Test = struct
  (* Helper function to convert list to string for printing. *)
  let list_to_string convert lst =
    "[" ^ (String.concat "; " (List.map convert lst)) ^ "]"

  (* Helper function to convert option to string for printing. *)
  let option_to_string convert opt =
    match opt with
    | None -> "None"
    | Some v -> "Some " ^ convert v

  (* Generic function to assert equality of 'a option types, and print result. *)
  let assert_equal convert expected actual =
    if expected = actual then
      Printf.printf "✓ Test passed\n"
    else
      Printf.printf "✗ Test failed\nExpected: %s\nGot: %s\n"
        (option_to_string convert expected)
        (option_to_string convert actual)

  (* Function to get the last element of a list as an option. *)
  let rec last = function
    | [] -> None
    | [x] -> Some x
    | _::xs -> last xs

  (* Run all tests. *)
  let run_tests () =
    print_endline "--------------------------------------";
    print_endline "Running Exercise 001 Tests:";
    
    print_endline "Test: Exercise 001 case 1";
    assert_equal string_of_int None (last []);
        
    print_endline "Test: Exercise 001 case 2";
    assert_equal (fun x -> x) (Some "d") (last ["a"; "b"; "c"; "d"]);
        
    print_endline "All tests completed."
end

(* Execute the tests *)
let () = Test.run_tests ();;
