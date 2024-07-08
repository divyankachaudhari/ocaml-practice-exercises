open Alcotest

module type Testable = sig
  type 'a rle = One of 'a | Many of int * 'a
  val decode : 'a rle list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_single_element () =
    check (list string) "Single Element" 
      ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
      (Tested.decode [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")])

  let test_empty_list () =
    check (list string) "empty list" [] (Tested.decode [])

  let run () =
    let open Alcotest in
    run "Run-Length Decoding Tests" [
      "decode", [
        test_case "Single Element" `Quick test_single_element;
        test_case "empty list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
