open Alcotest

module type Testable = sig
  val split : 'a list -> int -> 'a list * 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_split_into_two_parts () =
    check (pair (list string) (list string)) "split into two parts" 
      (["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"])
      (Tested.split ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3)

  let test_first_part_longer_than_list () =
    check (pair (list string) (list string)) "first part longer than list" 
      (["a"; "b"; "c"; "d"], []) 
      (Tested.split ["a"; "b"; "c"; "d"] 5)

  let test_empty_list () =
    check (pair (list string) (list string)) "empty list" ([], []) (Tested.split [] 3)

  let test_split_at_0 () =
    check (pair (list string) (list string)) "split at 0" 
      ([], ["a"; "b"; "c"; "d"])
      (Tested.split ["a"; "b"; "c"; "d"] 0)

  let test_split_at_lists_length () =
    check (pair (list string) (list string)) "split at list's length" 
      (["a"; "b"; "c"; "d"], []) 
      (Tested.split ["a"; "b"; "c"; "d"] 4)

  let run () =
    let open Alcotest in
    run "Split a List into Two Parts Tests" [
      "split", [
        test_case "split into two parts" `Quick test_split_into_two_parts;
        test_case "first part longer than list" `Quick test_first_part_longer_than_list;
        test_case "empty list" `Quick test_empty_list;
        test_case "split at 0" `Quick test_split_at_0;
        test_case "split at list's length" `Quick test_split_at_lists_length;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
