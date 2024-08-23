open Alcotest

module type Testable = sig
  val full_words : int -> string
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_full_words () =
    check string "for 175" "one-seven-five" (full_words 175);
    check string "for 0" "zero" (full_words 0);
    check string "for 5" "five" (full_words 5);
    check string "for 42" "four-two" (full_words 42);
    check string "for 909" "nine-zero-nine" (full_words 909)

  let run () =
    run "English Number Words" [
      "full_words", [test_case "test_full_words" `Quick test_full_words];
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
