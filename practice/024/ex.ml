open OUnit2

module type Testable = sig
  val lotto_select : int -> int -> int list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "lotto_select" >::: [
    "nil" >:: (fun _ -> assert_equal [] (Tested.lotto_select 0 0));
    "cons" >:: (fun _ -> assert_equal [20; 28; 45; 16; 24; 38] (Tested.lotto_select 6 49));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
