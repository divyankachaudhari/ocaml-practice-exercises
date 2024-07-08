open Alcotest

module type Testable = sig
  val gcd : int -> int -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_gcd_13_0 () =
    check int "gcd of 13 and 0" 13 (Tested.gcd 13 0)

  let test_gcd_20536_7826 () =
    check int "gcd of 20536 and 7826" 2 (Tested.gcd 20536 7826)

  let run () =
    let open Alcotest in
    run "gcd tests" [
      "gcd", [
        test_case "gcd_13_0" `Quick test_gcd_13_0;
        test_case "gcd_20536_7826" `Quick test_gcd_20536_7826;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
