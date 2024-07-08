open Alcotest

module type Testable = sig
  val last : 'a list -> 'a option
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check (option string) "last on empty list" None (Tested.last [])

  let test_cons () =
    check (option string) "last on list of four elements" (Some "d") (Tested.last ["a"; "b"; "c"; "d"])

  let run () =
    let open Alcotest in
    run "last tests" [
      "last", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
