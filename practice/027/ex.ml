open Alcotest

module type Testable = sig
  val group : 'a list -> int list -> 'a list list list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_empty_group () =
    check (list (list (list string))) "empty_group" [[]] (Tested.group [] [])

  let test_group () =
    check (list (list (list string))) "group" 
      [[["a"; "b"]; ["c"]]; [["a"; "c"]; ["b"]]; [["b"; "c"]; ["a"]];
      [["a"; "b"]; ["d"]]; [["a"; "c"]; ["d"]]; [["b"; "c"]; ["d"]];
      [["a"; "d"]; ["b"]]; [["b"; "d"]; ["a"]]; [["a"; "d"]; ["c"]];
      [["b"; "d"]; ["c"]]; [["c"; "d"]; ["a"]]; [["c"; "d"]; ["b"]]]
      (Tested.group ["a"; "b"; "c"; "d"] [2; 1])

  let run () =
    let open Alcotest in
    run "group tests" [
      "group", [
        test_case "empty_group" `Quick test_empty_group;
        test_case "group" `Quick test_group;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
