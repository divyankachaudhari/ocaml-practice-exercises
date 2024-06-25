open OUnit2

module type Testable = sig
  val is_palindrome : 'a list -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "is_palindrome" >::: [
    "palindrome" >:: (fun _ -> assert_equal true (Tested.is_palindrome ["x"; "a"; "m"; "a"; "x"]));
    "non_palindrome" >:: (fun _ -> assert_equal true (not (Tested.is_palindrome ["a"; "b"])));
    "empty_list" >:: (fun _ -> assert_equal true (Tested.is_palindrome []));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
