open OUnit2

module type Testable = sig
  val gcd : int -> int -> int
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "gcd" >::: [
    "gcd_13_0" >:: (fun _ -> assert_equal 13 (Tested.gcd 13 0));
    "gcd_20536_7826" >:: (fun _ -> assert_equal 2 (Tested.gcd 20536 7826));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
