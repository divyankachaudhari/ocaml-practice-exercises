open Alcotest

module type Testable = sig
  val extract : int -> 'a list -> 'a list list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check (list (list string)) "nil" [[]] (Tested.extract 0 ["a"])

  let test_cons () =
    check (list (list string)) "cons" 
      [["a"; "b"]; ["a"; "c"]; ["a"; "d"]; ["b"; "c"]; ["b"; "d"]; ["c"; "d"]]
      (Tested.extract 2 ["a"; "b"; "c"; "d"])

  let run () =
    let open Alcotest in
    run "extract tests" [
      "extract", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
