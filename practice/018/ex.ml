open Alcotest

module type Testable = sig
  val slice : 'a list -> int -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_slice_from_list () =
    check (list string) "slice from list" 
      ["c"; "d"; "e"; "f"; "g"]
      (Tested.slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 2 6)

  let test_slice_entire_list () =
    check (list string) "slice entire list" 
      ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"]
      (Tested.slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 0 9)

  let test_slice_with_zero_elements () =
    check (list string) "slice with zero elements" [] 
      (Tested.slice ["a"; "b"; "c"; "d"] 2 1)

  let test_slice_with_indices_beyond_list_length () =
    check (list string) "slice with indices beyond list length" [] 
      (Tested.slice ["a"; "b"; "c"; "d"] 4 5)

  let run () =
    let open Alcotest in
    run "Extract a Slice From a List Tests" [
      "slice", [
        test_case "slice from list" `Quick test_slice_from_list;
        test_case "slice entire list" `Quick test_slice_entire_list;
        test_case "slice with zero elements" `Quick test_slice_with_zero_elements;
        test_case "slice with indices beyond list length" `Quick test_slice_with_indices_beyond_list_length;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
