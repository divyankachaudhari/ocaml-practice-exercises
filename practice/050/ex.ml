open Alcotest

module type Testable = sig
  val huffman : (string * int) list -> (string * string) list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_huffman () =
    check (list (pair string string)) "Test" 
      [("a", "0"); ("c", "100"); ("b", "101"); ("f", "1100"); ("e", "1101"); ("d", "111")]
      (Tested.huffman [("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5)])

  let run () =
    let open Alcotest in
    run "Huffman Tests" [
      "huffman", [
        test_case "Test" `Quick test_huffman;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
