open Alcotest

module type Testable = sig
  val compress : 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_non_empty_list () =
    check (list string) "non-empty list" ["a"; "b"; "c"; "a"; "d"; "e"]
      (Tested.compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])

  let test_empty_list () =
    check (list string) "empty list" [] (Tested.compress [])

  let run () =
    let open Alcotest in
    run "compress tests" [
      "compress", [
        test_case "non-empty list" `Quick test_non_empty_list;
        test_case "empty list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
