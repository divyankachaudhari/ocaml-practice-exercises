let primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71;
  73; 79; 83; 89; 97; 101; 103; 107; 109; 113; 127; 131; 137; 139; 149; 151;
  157; 163; 167; 173; 179; 181; 191; 193; 197; 199]

let _ = Alcotest.(check (list int)) "all primes in range 0 to 200"
  primes
  (all_primes 0 200)

let _ = Alcotest.(check (list int)) "all primes in range 50 to 150"
  (List.filter (fun n -> 50 <= n && n <= 150) primes)
  (all_primes 50 150)

let _ = Alcotest.(check (list int)) "no primes in range 150 to 50"
  []
  (all_primes 150 50)
