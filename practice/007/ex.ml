open Alcotest

module type Testable = sig
  type 'a node = One of 'a | Many of 'a node list
  val flatten : 'a node list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_non_empty_list () =
    check (list string) "non-empty list" ["a"; "b"; "c"; "d"; "e"]
      (Tested.flatten [One "a"; Many [One "b"; Many [One "c"; One "d"]; One "e"]])

  let test_empty_list () =
    check (list string) "empty list" [] (Tested.flatten [])

  let run () =
    let open Alcotest in
    run "flatten tests" [
      "flatten", [
        test_case "non-empty list" `Quick test_non_empty_list;
        test_case "empty list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
