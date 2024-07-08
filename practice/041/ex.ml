open Alcotest

module type Testable = sig
  val goldbach_list : int -> int -> (int * (int * int)) list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_goldbach_list_9_20 () =
    check (list (pair int (pair int int))) "goldbach_list from 9 to 20" 
      [(10, (3, 7)); (12, (5, 7)); (14, (3, 11)); (16, (3, 13)); (18, (5, 13)); (20, (3, 17))]
      (Tested.goldbach_list 9 20)

  let run () =
    let open Alcotest in
    run "Goldbach Compositions Tests" [
      "goldbach_list", [
        test_case "goldbach_list from 9 to 20" `Quick test_goldbach_list_9_20;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
