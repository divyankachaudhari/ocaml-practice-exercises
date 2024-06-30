let _ = Alcotest.(check int) "phi of 10" 4 (phi 10)
let _ = Alcotest.(check int) "phi of 1 (edge case)" 1 (phi 1)
let _ = Alcotest.(check int) "phi of a prime number" 12 (phi 13)
