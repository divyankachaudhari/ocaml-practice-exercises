open Alcotest

module type Testable = sig
  val coprime : int -> int -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_coprime_numbers () =
    check bool "13 and 27 should be coprime" true (Tested.coprime 13 27)

  let test_not_coprime_numbers () =
    check bool "20536 and 7826 should not be coprime" false (Tested.coprime 20536 7826)

  let run () =
    let open Alcotest in
    run "Coprime tests" [
      "coprime", [
        test_case "coprime numbers" `Quick test_coprime_numbers;
        test_case "not coprime numbers" `Quick test_not_coprime_numbers;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
