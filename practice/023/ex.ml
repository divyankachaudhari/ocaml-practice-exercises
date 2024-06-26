open OUnit2

module type Testable = sig
  val rand_select : 'a list -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
    let tests =
      "Random select n Tests" >::: [
        "random select 3" >:: (fun _ -> assert_equal 3 (List.length (Tested.rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3)));
        "random select 5" >:: (fun _ -> assert_equal 5 (List.length (Tested.rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 5)));
      ]

  let v = tests
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
