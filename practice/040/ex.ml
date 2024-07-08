open Alcotest

module type Testable = sig
  val goldbach : int -> int * int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_goldbach_of_4 () =
    check (pair int int) "goldbach of 4" (2, 2) (Tested.goldbach 4)

  let test_goldbach_of_28 () =
    check (pair int int) "goldbach of 28" (5, 23) (Tested.goldbach 28)

  let run () =
    let open Alcotest in
    run "Goldbach's Conjecture Tests" [
      "goldbach", [
        test_case "goldbach of 4" `Quick test_goldbach_of_4;
        test_case "goldbach of 28" `Quick test_goldbach_of_28;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
