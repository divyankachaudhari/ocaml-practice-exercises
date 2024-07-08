open Alcotest

module type Testable = sig
  val length : 'a list -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check int "length of empty list" 0 (Tested.length [])

  let test_cons () =
    check int "length of list with three elements" 3 (Tested.length ["a"; "b"; "c"])

  let run () =
    let open Alcotest in
    run "length tests" [
      "length", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = struct
  let length lst = List.length lst
end

module Answer : Testable = struct
  let length lst = List.length lst
end
