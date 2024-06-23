open OUnit2

(* Define the test suite *)
let suite = "suite" >::: [
  "last" >::: [
    "nil" >:: (fun _ -> assert_equal None (last []));
    "cons" >:: (fun _ -> assert_equal (Some "d") (last ["a"; "b"; "c"; "d"]));
  ]
]

(* Run the tests *)
let () = run_test_tt_main suite
