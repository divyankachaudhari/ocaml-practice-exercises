open Alcotest

module type Testable = sig
  type 'a rle = One of 'a | Many of int * 'a
  val encode : 'a list -> 'a rle list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let pp_rle_string out = function
  | Tested.One x -> Format.fprintf out "One %s" x
  | Many (n, x) -> Format.fprintf out "Many (%i, %s)" n x

  let test_single_elements () =
    check (list (of_pp pp_rle_string))
      "single elements" 
      [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")]
      (Tested.encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])

  let test_empty_list () =
    check (list (of_pp pp_rle_string))
      "empty list" [] (Tested.encode [])

  let run () =
    let open Alcotest in
    run "RLE encode tests" [
      "encode", [
        test_case "single elements" `Quick test_single_elements;
        test_case "empty list" `Quick test_empty_list;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
