open Alcotest

module type Testable = sig
  val identifier : string -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_valid_identifiers () =
    let valid_cases = [
      "this-is-a-long-identifier";
      "a";
      "abc-def-ghi";
    ] in
    List.iter (fun id ->
      check bool ("valid identifier '" ^ id ^ "'") true (Tested.identifier id)
    ) valid_cases

  let test_invalid_identifiers () =
    let invalid_cases = [
      "-invalid";
      "invalid-";
      "inva-lid--";
      "invalid--identifier";
    ] in
    List.iter (fun id ->
      check bool ("invalid identifier '" ^ id ^ "'") false (Tested.identifier id)
    ) invalid_cases

  let run () =
    run "Syntax Checker Tests" [
      "identifier", [
        test_case "valid identifier cases" `Quick test_valid_identifiers;
        test_case "invalid identifier cases" `Quick test_invalid_identifiers;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
