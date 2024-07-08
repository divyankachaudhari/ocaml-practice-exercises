open Alcotest

module type Testable = sig
  val rotate : 'a list -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_rotate_3_places_left () =
    check (list string) "rotate 3 places left" 
      ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
      (Tested.rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3)

  let test_rotate_with_negative_n () =
    check (list string) "rotate with negative n" 
      ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
      (Tested.rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-5))

  let test_rotate_more_than_length () =
    check (list string) "rotate more than length" 
      ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
      (Tested.rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 11)

  let test_rotate_zero_places () =
    check (list string) "rotate zero places" 
      ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"]
      (Tested.rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 0)

  let test_rotate_empty_list () =
    check (list string) "rotate empty list" [] 
      (Tested.rotate [] 3)

  let run () =
    let open Alcotest in
    run "Rotate List Tests" [
      "rotate", [
        test_case "rotate 3 places left" `Quick test_rotate_3_places_left;
        test_case "rotate with negative n" `Quick test_rotate_with_negative_n;
        test_case "rotate more than length" `Quick test_rotate_more_than_length;
        test_case "rotate zero places" `Quick test_rotate_zero_places;
        test_case "rotate empty list" `Quick test_rotate_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
