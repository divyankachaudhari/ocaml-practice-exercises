open Alcotest

module type Testable = sig
  val factors : int -> int list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_prime_factors_of_315 () =
    check (list int) "prime factors of 315" [3; 3; 5; 7] (Tested.factors 315)

  let test_prime_factors_of_1 () =
    check (list int) "prime factors of 1 (edge case)" [] (Tested.factors 1)

  let test_prime_factors_of_prime_number () =
    check (list int) "prime factors of a prime number" [13] (Tested.factors 13)

  let run () =
    let open Alcotest in
    run "Prime Factors Tests" [
      "factors", [
        test_case "prime factors of 315" `Quick test_prime_factors_of_315;
        test_case "prime factors of 1 (edge case)" `Quick test_prime_factors_of_1;
        test_case "prime factors of a prime number" `Quick test_prime_factors_of_prime_number;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
