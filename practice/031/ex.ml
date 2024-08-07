open Alcotest

module type Testable = sig
  val is_prime : int -> bool
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  let rec flag_prime n = function
    | [] -> []
    | p :: u ->
      if n = p then
        (n, true) :: flag_prime (n + 1) u
      else
        (n, false) :: flag_prime (n + 1) (p :: u)

  let primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71; 73; 79; 83; 89; 97]

  let tests =
    List.map (fun (n, p) ->
      let test_name = Printf.sprintf "Testing if %d is prime" n in
      test_case test_name `Quick (fun () -> check bool test_name p (Tested.is_prime n))
    ) (flag_prime 0 primes)

  let run () =
    let open Alcotest in
    run "is_prime tests" [
      "is_prime", tests
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
