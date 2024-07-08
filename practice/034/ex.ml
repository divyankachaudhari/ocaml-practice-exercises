open Alcotest

module type Testable = sig
  val phi : int -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_phi_of_10 () =
    check int "phi of 10" 4 (Tested.phi 10)

  let test_phi_of_1 () =
    check int "phi of 1 (edge case)" 1 (Tested.phi 1)

  let test_phi_of_prime_number () =
    check int "phi of a prime number" 12 (Tested.phi 13)

  let run () =
    let open Alcotest in
    run "Euler's Totient Function Tests" [
      "phi", [
        test_case "phi of 10" `Quick test_phi_of_10;
        test_case "phi of 1 (edge case)" `Quick test_phi_of_1;
        test_case "phi of a prime number" `Quick test_phi_of_prime_number;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
