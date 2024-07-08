open Alcotest

module type Testable = sig
  val duplicate : 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_non_empty_list () =
    check (list string) "non-empty list" 
      ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]
      (Tested.duplicate ["a"; "b"; "c"; "c"; "d"])

  let test_empty_list () =
    check (list string) "empty list" [] (Tested.duplicate [])

  let run () =
    let open Alcotest in
    run "Duplicate Elements Tests" [
      "duplicate", [
        test_case "non-empty list" `Quick test_non_empty_list;
        test_case "empty list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
