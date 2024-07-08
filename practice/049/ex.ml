open Alcotest

module type Testable = sig
  val gray : int -> string list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let test_gray_n_1 () =
    check (list string) "n = 1" ["0"; "1"] (Tested.gray 1)

  let test_gray_n_2 () =
    check (list string) "n = 2" ["00"; "01"; "11"; "10"] (Tested.gray 2)

  let test_gray_n_3 () =
    check (list string) "n = 3" ["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"] (Tested.gray 3)

  let run () =
    let open Alcotest in
    run "Gray Code Tests" [
      "gray", [
        test_case "n = 1" `Quick test_gray_n_1;
        test_case "n = 2" `Quick test_gray_n_2;
        test_case "n = 3" `Quick test_gray_n_3;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
