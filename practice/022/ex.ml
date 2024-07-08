open Alcotest

module type Testable = sig
  val range : int -> int -> int list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_ascending_order () =
    check (list int) "ascending order" 
      [4; 5; 6; 7; 8; 9]
      (Tested.range 4 9)

  let test_descending_order () =
    check (list int) "descending order" 
      [9; 8; 7; 6; 5; 4]
      (Tested.range 9 4)

  let test_equal_boundaries () =
    check (list int) "equal boundaries" 
      [4]
      (Tested.range 4 4)

  let run () =
    let open Alcotest in
    run "Create List from Range Tests" [
      "range", [
        test_case "ascending order" `Quick test_ascending_order;
        test_case "descending order" `Quick test_descending_order;
        test_case "equal boundaries" `Quick test_equal_boundaries;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
