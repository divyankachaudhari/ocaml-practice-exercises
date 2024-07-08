open Alcotest

module type Testable = sig
  val remove_at : int -> 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_remove_element_at_1 () =
    check (list string) "remove element at 1" 
      ["a"; "c"; "d"]
      (Tested.remove_at 1 ["a"; "b"; "c"; "d"])

  let test_remove_beyond_list_length () =
    check (list string) "remove beyond list length" 
      ["a"; "b"; "c"; "d"]
      (Tested.remove_at 4 ["a"; "b"; "c"; "d"])

  let test_remove_from_empty_list () =
    check (list string) "remove from empty list" [] 
      (Tested.remove_at 1 [])

  let run () =
    let open Alcotest in
    run "Remove the K'th Element Tests" [
      "remove_at", [
        test_case "remove element at 1" `Quick test_remove_element_at_1;
        test_case "remove beyond list length" `Quick test_remove_beyond_list_length;
        test_case "remove from empty list" `Quick test_remove_from_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
