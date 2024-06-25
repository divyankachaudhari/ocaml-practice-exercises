open OUnit2

module type Testable = sig
  val last_two : 'a list -> ('a * 'a) option
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "last_two" >::: [
    "nil" >:: (fun _ -> assert_equal None (Tested.last_two ["a"]));
    "cons" >:: (fun _ -> assert_equal (Some ("c", "d")) (Tested.last_two ["a"; "b"; "c"; "d"]));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
