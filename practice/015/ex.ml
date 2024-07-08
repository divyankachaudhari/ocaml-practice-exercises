open Alcotest

module type Testable = sig
  val replicate : 'a list -> int -> 'a list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_list_with_replication () =
    check (list string) "list with replication" 
      ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"]
      (Tested.replicate ["a"; "b"; "c"] 3)

  let test_empty_list () =
    check (list string) "empty list" [] (Tested.replicate [] 3)

  let test_zero_replication () =
    check (list string) "zero replication" [] (Tested.replicate ["a"; "b"; "c"] 0)

  let test_replication_factor_of_1 () =
    check (list string) "replication factor of 1" ["a"; "b"; "c"] (Tested.replicate ["a"; "b"; "c"] 1)

  let run () =
    let open Alcotest in
    run "Replicate the elements of a list a given number of times." [
      "replicate", [
        test_case "list with replication" `Quick test_list_with_replication;
        test_case "empty list" `Quick test_empty_list;
        test_case "zero replication" `Quick test_zero_replication;
        test_case "replication factor of 1" `Quick test_replication_factor_of_1;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
