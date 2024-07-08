open Alcotest

module type Testable = sig
  val permutation : 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_nil () =
    check (list string) "nil" [] (Tested.permutation [])

  let test_cons () =
    let result = Tested.permutation ["a"; "b"; "c"; "d"; "e"; "f"] in
    check bool "same length" true (List.length result = 6);
    check bool "all elements present" true 
      (List.for_all (fun x -> List.mem x ["a"; "b"; "c"; "d"; "e"; "f"]) result)

  let run () =
    let open Alcotest in
    run "permutation tests" [
      "permutation", [
        test_case "nil" `Quick test_nil;
        test_case "cons" `Quick test_cons;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
