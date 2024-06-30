let _ = Alcotest.(check (list (pair int int))) "prime factors with multiplicities of 315"
  [(3, 2); (5, 1); (7, 1)]
  (factors 315)

let _ = Alcotest.(check (list (pair int int))) "prime factors with multiplicities of 1 (edge case)"
  []
  (factors 1)

let _ = Alcotest.(check (list (pair int int))) "prime factors with multiplicities of a prime number"
  [(13, 1)]
  (factors 13)
