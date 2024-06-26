open OUnit2

module type Testable = sig
  val last : 'a list -> 'a option
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let v = "last" >::: [
    "nil" >:: (fun _ -> assert_equal None (Tested.last []));
    "cons" >:: (fun _ -> assert_equal (Some "d") (Tested.last ["a"; "b"; "c"; "d"]));
  ]
  let run () = OUnit2.run_test_tt_main v
end

module Work : Testable = struct
  let last lst = match List.rev lst with
    | [] -> None
    | h :: _ -> Some h
end

module Answer : Testable = struct
  let last lst = match List.rev lst with
    | [] -> None
    | h :: _ -> Some h
end

