let rec flag_prime n = function
  | [] -> []
  | p :: u ->
    if n = p then
      (p, true) :: flag_prime (n + 1) u
    else
      (n, false) :: flag_prime (n + 1) (p :: u)

let primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71; 73; 79; 83; 89; 97]

let _ =
  let test_cases = flag_prime 0 primes in
  List.iter (fun (n, p) ->
    let test_name = Printf.sprintf "is_prime %d" n in
    Alcotest.(check bool) test_name p (is_prime n)
  ) test_cases
