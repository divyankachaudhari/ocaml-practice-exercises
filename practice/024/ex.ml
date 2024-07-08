open Alcotest

module type Testable = sig
  val lotto_select : int -> int -> int list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check (list int) "nil" [] (Tested.lotto_select 0 0)

  let test_cons () =
    let result = Tested.lotto_select 6 49 in
    check int "length of the list" 6 (List.length result);
    check bool "all elements within range" true 
      (List.for_all (fun x -> x >= 1 && x <= 49) result)

  let run () =
    let open Alcotest in
    run "lotto_select tests" [
      "lotto_select", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
