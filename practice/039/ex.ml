open Alcotest

module type Testable = sig
  val all_primes : int -> int -> int list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71;
  73; 79; 83; 89; 97; 101; 103; 107; 109; 113; 127; 131; 137; 139; 149; 151;
  157; 163; 167; 173; 179; 181; 191; 193; 197; 199]

  let test_all_primes () =
    check (list int) "all_primes" primes (Tested.all_primes 0 200)

  let test_some_primes () =
    check (list int) "some_primes" (List.filter (fun n -> 50 <= n && n <= 150) primes) (Tested.all_primes 50 150)

  let test_no_primes () =
    check (list int) "no_primes" [] (Tested.all_primes 150 50)

  let run () =
    let open Alcotest in
    run "List_primes" [
      "all_primes", [
        test_case "all" `Quick test_all_primes;
        test_case "some" `Quick test_some_primes;
        test_case "none" `Quick test_no_primes;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
