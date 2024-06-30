let _ = Alcotest.(check (list int)) "prime factors of 315" [3; 3; 5; 7] (factors 315)
let _ = Alcotest.(check (list int)) "prime factors of 1 (edge case)" [] (factors 1)
let _ = Alcotest.(check (list int)) "prime factors of a prime number" [13] (factors 13)
