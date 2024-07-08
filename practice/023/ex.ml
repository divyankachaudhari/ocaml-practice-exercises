open Alcotest

module type Testable = sig
  val rand_select : 'a list -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_random_select_3 () =
    check int "random select 3" 
      3
      (List.length (Tested.rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3))

  let test_random_select_5 () =
    check int "random select 5" 
      5
      (List.length (Tested.rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 5))

  let run () =
    let open Alcotest in
    run "Random select n Tests" [
      "rand_select", [
        test_case "random select 3" `Quick test_random_select_3;
        test_case "random select 5" `Quick test_random_select_5;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
