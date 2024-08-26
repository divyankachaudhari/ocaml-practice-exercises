open Test_lib
open Report

let phi_naive n =
  let rec gcd a b = if b = 0 then a else gcd b (a mod b) in
  let coprime a b = gcd a b = 1 in
  let rec count_coprime acc d =
    if d < n then count_coprime (if coprime n d then acc + 1 else acc) (d + 1)
    else acc in
  if n = 1 then 1 else count_coprime 0 1

let timeit f a =
  let t0 = Unix.gettimeofday () in
  ignore (f a);
  let t1 = Unix.gettimeofday () in
  t1 -. t0

let test_values = [10090; 100090; 1000090]

let exercise_phi_performance =
  Section ([ Text "Function: "; Code "phi" ],
    List.map (fun n ->
      let result_phi_naive = phi_naive n in
      let result_phi = Solution.phi n in
      let time_phi_naive = timeit phi_naive n in
      let time_phi = timeit Solution.phi n in
      if result_phi_naive = result_phi && time_phi < time_phi_naive then
        Message ([ Text (Printf.sprintf "phi(%d) correct and faster than naive implementation" n) ], Success 1)
      else
        Message ([ Text (Printf.sprintf "phi(%d) incorrect or slower than naive implementation" n) ], Failure)
    ) test_values)

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_phi_performance ]
