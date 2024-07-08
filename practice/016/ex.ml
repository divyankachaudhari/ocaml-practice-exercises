open Alcotest

module type Testable = sig
  val drop : 'a list -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_drop_every_3rd_from_list () =
    check (list string) "drop every 3rd from list" 
      ["a"; "b"; "d"; "e"; "g"; "h"; "j"]
      (Tested.drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3)

  let test_drop_with_empty_list () =
    check (list string) "drop with empty list" [] (Tested.drop [] 3)

  let test_drop_with_n_larger_than_list_length () =
    check (list string) "drop with n larger than list length" ["a"; "b"] (Tested.drop ["a"; "b"] 3)

  let test_drop_with_n_equal_to_0 () =
    check (list string) "drop with n equal to 0" ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 
      (Tested.drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 0)

  let test_drop_with_n_equal_to_1 () =
    check (list string) "drop with n equal to 1" [] 
      (Tested.drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 1)

  let run () =
    let open Alcotest in
    run "Drop Every N'th Element Tests" [
      "drop", [
        test_case "drop every 3rd from list" `Quick test_drop_every_3rd_from_list;
        test_case "drop with empty list" `Quick test_drop_with_empty_list;
        test_case "drop with n larger than list length" `Quick test_drop_with_n_larger_than_list_length;
        test_case "drop with n equal to 0" `Quick test_drop_with_n_equal_to_0;
        test_case "drop with n equal to 1" `Quick test_drop_with_n_equal_to_1;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
