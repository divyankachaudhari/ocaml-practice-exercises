open OUnit2

module type Testable = sig
  type 'a node = One of 'a | Many of 'a node list
  val flatten : 'a node list -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let tests = "flatten" >::: [
    "non-empty list" >:: (fun _ -> 
      assert_equal ["a"; "b"; "c"; "d"; "e"]
       (Tested.flatten [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]]));
    "empty list" >:: (fun _ -> 
      assert_equal [] (Tested.flatten []));
  ]

  let v = "flatten Lists Tests" >::: [
    tests
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
