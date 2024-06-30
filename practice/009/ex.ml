open OUnit2

module type Testable = sig
  val pack : 'a list -> 'a list list 
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "pack" >::: [
    "example" >:: (fun _ ->
      assert_equal
        [["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"];
         ["e"; "e"; "e"; "e"]]
        (Tested.pack ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"]))
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
