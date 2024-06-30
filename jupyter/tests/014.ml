let _ = Alcotest.(check (list string)) "duplicate non-empty list"
  ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]
  (duplicate ["a"; "b"; "c"; "c"; "d"])

let _ = Alcotest.(check (list string)) "duplicate empty list"
  []
  (duplicate [])
