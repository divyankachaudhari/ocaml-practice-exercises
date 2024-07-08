open Alcotest

module type Testable = sig
  val last_two : 'a list -> ('a * 'a) option
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check (option (pair string string)) "last_two on single element" None (Tested.last_two ["a"])

  let test_cons () =
    check (option (pair string string)) "last_two on list of four elements" (Some ("c", "d")) (Tested.last_two ["a"; "b"; "c"; "d"])

  let run () =
    let open Alcotest in
    run "last_two tests" [
      "last_two", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
