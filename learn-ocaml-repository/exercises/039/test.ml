open Test_lib
open Report

let primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71;
  73; 79; 83; 89; 97; 101; 103; 107; 109; 113; 127; 131; 137; 139; 149; 151;
  157; 163; 167; 173; 179; 181; 191; 193; 197; 199]

let exercise_all_primes =
  Section ([ Text "Function: "; Code "all_primes" ],
    test_function_2_against_solution
      [%ty: int -> int -> int list]
      "all_primes"
      ~gen:0
      [
        (0, 200); 
        (50, 150); 
        (150, 50)  
      ])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_all_primes ]
