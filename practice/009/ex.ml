open Alcotest

module type Testable = sig
  val pack : 'a list -> 'a list list 
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_example () =
    check (list (list string)) "example test" 
      [["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"]; ["e"; "e"; "e"; "e"]]
      (Tested.pack ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"])

  let run () =
    let open Alcotest in
    run "pack tests" [
      "pack", [
        test_case "example" `Quick test_example;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
