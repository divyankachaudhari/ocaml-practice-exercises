open Test_lib
open Report

let primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71; 73; 79; 83; 89; 97]

let non_primes = 
  let rec create_non_primes acc n = 
    if n > 100 then acc
    else if List.mem n primes then create_non_primes acc (n + 1)
    else create_non_primes (n :: acc) (n + 1)
  in create_non_primes [] 0

let exercise_is_prime =
  Section ([ Text "Function: "; Code "is_prime" ],
    [
      Section ([ Text "Testing primes" ],
        test_function_1_against_solution
          [%ty: int -> bool]
          "is_prime"
          ~gen:0
          primes);

      Section ([ Text "Testing non-primes" ],
        test_function_1_against_solution
          [%ty: int -> bool]
          "is_prime"
          ~gen:0
          non_primes);
    ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_is_prime ]
