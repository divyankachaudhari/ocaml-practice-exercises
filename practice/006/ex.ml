open Alcotest

module type Testable = sig
  val is_palindrome : 'a list -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_palindrome () =
    check bool "palindrome list" true (Tested.is_palindrome ["x"; "a"; "m"; "a"; "x"])

  let test_non_palindrome () =
    check bool "non-palindrome list" true (not (Tested.is_palindrome ["a"; "b"]))

  let test_empty_list () =
    check bool "empty list" true (Tested.is_palindrome [])

  let run () =
    let open Alcotest in
    run "is_palindrome tests" [
      "is_palindrome", [
        test_case "palindrome" `Quick test_palindrome;
        test_case "non_palindrome" `Quick test_non_palindrome;
        test_case "empty_list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
