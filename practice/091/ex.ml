open Alcotest

module type Testable = sig
  val queens_positions : int -> int list list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let test_queens_positions_4 () =
    let expected = [[3; 1; 4; 2]; [2; 4; 1; 3]] in
    check (list (list int)) "queens_positions 4" expected (queens_positions 4)

  let test_queens_positions_8 () =
    (* Only checking the number of solutions since there are 92 solutions *)
    let result = queens_positions 8 in
    check int "queens_positions 8 has 92 solutions" 92 (List.length result)

  let run () =
    let open Alcotest in
    run "Eight Queens Problem" [
      "queens_positions", [
        test_case "test_queens_positions_4" `Quick test_queens_positions_4;
        test_case "test_queens_positions_8" `Quick test_queens_positions_8;
      ]
    ]
end

module Work : Testable = struct
  include Work.Impl
end

module Answer : Testable = struct
  include Answer.Impl
end
