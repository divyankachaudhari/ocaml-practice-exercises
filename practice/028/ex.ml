open Alcotest

module type Testable = sig
  val length_sort : 'a list list -> 'a list list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_empty_list () =
    check (list (list string)) "empty_list" [[]] (Tested.length_sort [[]])

  let test_length_sort () =
    check (list (list string)) "length_sort" 
      [["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"]; ["f"; "g"; "h"]; ["i"; "j"; "k"; "l"]]
      (Tested.length_sort [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"]; ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]])

  let run () =
    let open Alcotest in
    run "length_sort tests" [
      "length_sort", [
        test_case "empty_list" `Quick test_empty_list;
        test_case "length_sort" `Quick test_length_sort;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
