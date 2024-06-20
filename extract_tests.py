import os
import re


def extract_test_cases(file_path):
    """ Extract test cases from the ex.ml file. """
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # Extract the test cases within the list
    test_cases_match = re.findall(
        r'assert_equal\s+(.*?)\s+\((.*?)\);', content, re.DOTALL)
    return test_cases_match


def format_test_cases(test_cases, module_name):
    """ Format the extracted test cases into the required test structure. """
    formatted_cases = []
    for idx, (expected, actual) in enumerate(test_cases, start=1):
        # Remove the `Tested.` prefix if present and extra right bracket
        actual = re.sub(r'Tested\.', '', actual).strip().rstrip(')')
        formatted_cases.append(f"""
    print_endline "Test: {module_name} case {idx}";
    assert_equal {expected.strip()} ({actual.strip()});
        """)

    formatted_cases_str = '\n'.join(formatted_cases)
    return formatted_cases_str


def create_test_script(test_cases_str, output_path, module_name):
    """ Create the test script file in the required format. """
    test_script = f"""
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
      Printf.printf "✓ Test passed\\n"
    else
      Printf.printf "✗ Test failed\\nExpected: %s\\nGot: %s\\n"
        (option_to_string string_of_int expected)
        (option_to_string string_of_int actual)

  (* Run all tests. *)
  let run_tests () =
    print_endline "--------------------------------------";
    print_endline "Running {module_name} Tests:";
    {test_cases_str}
    print_endline "All tests completed."
end

(* Execute the tests and suppress any final output from this cell *)
let () = Test.run_tests ();;
    """
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(test_script)


def main():
    practice_dir = './practice'
    output_dir = './jupyter/tests'
    os.makedirs(output_dir, exist_ok=True)

    for root, _, files in os.walk(practice_dir):
        if "_build" in root:
            continue  # Skip _build directories
        for filename in files:
            if filename == 'ex.ml':
                file_path = os.path.join(root, filename)
                exercise_number = root.split('/')[-1]
                test_cases = extract_test_cases(file_path)
                module_name = f"Exercise {exercise_number}"
                formatted_test_cases = format_test_cases(
                    test_cases, module_name)
                output_path = os.path.join(output_dir, f"{exercise_number}.ml")
                create_test_script(formatted_test_cases,
                                   output_path, module_name)
                print(f"Processed {file_path}")


if __name__ == "__main__":
    main()
