open Alcotest

module type Testable = sig
  val rev : 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check (list string) "reverse of empty list" [] (Tested.rev [])

  let test_cons () =
    check (list string) "reverse of list with three elements" ["c"; "b"; "a"] (Tested.rev ["a"; "b"; "c"])

  let run () =
    let open Alcotest in
    run "rev tests" [
      "rev", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = struct
  let rev lst = List.rev lst
end

module Answer : Testable = struct
  let rev lst = List.rev lst
end
