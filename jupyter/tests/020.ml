let _ = Alcotest.(check (list string)) "remove element at 1"
  ["a"; "c"; "d"]
  (remove_at 1 ["a"; "b"; "c"; "d"])

let _ = Alcotest.(check (list string)) "remove beyond list length"
  ["a"; "b"; "c"; "d"]
  (remove_at 4 ["a"; "b"; "c"; "d"])

let _ = Alcotest.(check (list string)) "remove from empty list"
  []
  (remove_at 1 [])
