open Alcotest

module type Testable = sig
  val encode : 'a list -> (int * 'a) list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_non_empty_list () =
    check (list (pair int string)) "non-empty list" 
      [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
      (Tested.encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])

  let test_empty_list () =
    check (list (pair int string)) "empty list" [] (Tested.encode [])

  let run () =
    let open Alcotest in
    run "encode tests" [
      "encode", [
        test_case "non-empty list" `Quick test_non_empty_list;
        test_case "empty list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
