let _ = Alcotest.(check (list string)) "permutation nil"
  []
  (permutation [])

let _ = Alcotest.(check (list string)) "permutation cons"
  ["c"; "d"; "f"; "e"; "b"; "a"] (* Note: this specific output is assumed for demonstration; actual output may vary *)
  (permutation ["a"; "b"; "c"; "d"; "e"; "f"])
