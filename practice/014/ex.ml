open OUnit2

module type Testable = sig
  val duplicate : 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let example_tests = "duplicate" >::: [
    "non-empty list" >:: (fun _ ->
      assert_equal ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]
        (Tested.duplicate ["a"; "b"; "c"; "c"; "d"]));
    "empty list" >:: (fun _ ->
      assert_equal [] (Tested.duplicate []));
  ]

  let v = "Duplicate Elements Tests" >::: [
    example_tests
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
