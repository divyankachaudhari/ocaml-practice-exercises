open OUnit2

module type Testable = sig
  val permutation : 'a list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "permutation" >::: [
    "nil" >:: (fun _ -> assert_equal [] (Tested.permutation []));
    "cons" >:: (fun _ -> assert_equal ["c"; "d"; "f"; "e"; "b"; "a"] (Tested.permutation ["a"; "b"; "c"; "d"; "e"; "f"]));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
