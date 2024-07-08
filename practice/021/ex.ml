open Alcotest

module type Testable = sig
  val insert_at : 'a -> int -> 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_insert_in_the_middle () =
    check (list string) "insert in the middle" 
      ["a"; "alpha"; "b"; "c"; "d"]
      (Tested.insert_at "alpha" 1 ["a"; "b"; "c"; "d"])

  let test_insert_at_the_beginning () =
    check (list string) "insert at the beginning" 
      ["beta"; "a"; "b"; "c"; "d"]
      (Tested.insert_at "beta" 0 ["a"; "b"; "c"; "d"])

  let test_insert_at_the_end () =
    check (list string) "insert at the end" 
      ["a"; "b"; "c"; "d"; "alpha"]
      (Tested.insert_at "alpha" 4 ["a"; "b"; "c"; "d"])

  let test_insert_beyond_the_end () =
    check (list string) "insert beyond the end" 
      ["a"; "b"; "c"; "d"; "beta"]
      (Tested.insert_at "beta" 6 ["a"; "b"; "c"; "d"])

  let test_insert_into_empty_list () =
    check (list string) "insert into empty list" 
      ["alpha"]
      (Tested.insert_at "alpha" 0 [])

  let run () =
    let open Alcotest in
    run "Insert Element at Position Tests" [
      "insert_at", [
        test_case "insert in the middle" `Quick test_insert_in_the_middle;
        test_case "insert at the beginning" `Quick test_insert_at_the_beginning;
        test_case "insert at the end" `Quick test_insert_at_the_end;
        test_case "insert beyond the end" `Quick test_insert_beyond_the_end;
        test_case "insert into empty list" `Quick test_insert_into_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
