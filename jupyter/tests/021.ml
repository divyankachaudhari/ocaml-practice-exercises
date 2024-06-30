let _ = Alcotest.(check (list string)) "insert in the middle"
  ["a"; "alpha"; "b"; "c"; "d"]
  (insert_at "alpha" 1 ["a"; "b"; "c"; "d"])

let _ = Alcotest.(check (list string)) "insert at the beginning"
  ["beta"; "a"; "b"; "c"; "d"]
  (insert_at "beta" 0 ["a"; "b"; "c"; "d"])

let _ = Alcotest.(check (list string)) "insert at the end"
  ["a"; "b"; "c"; "d"; "alpha"]
  (insert_at "alpha" 4 ["a"; "b"; "c"; "d"])

let _ = Alcotest.(check (list string)) "insert beyond the end"
  ["a"; "b"; "c"; "d"; "beta"]
  (insert_at "beta" 6 ["a"; "b"; "c"; "d"])

let _ = Alcotest.(check (list string)) "insert into empty list"
  ["alpha"]
  (insert_at "alpha" 0 [])
