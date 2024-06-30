let _ = Alcotest.(check (list string)) "replicate list with replication"
  ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"]
  (replicate ["a"; "b"; "c"] 3)

let _ = Alcotest.(check (list string)) "replicate empty list"
  []
  (replicate [] 3)

let _ = Alcotest.(check (list string)) "replicate with zero replication"
  []
  (replicate ["a"; "b"; "c"] 0)

let _ = Alcotest.(check (list string)) "replicate with replication factor of 1"
  ["a"; "b"; "c"]
  (replicate ["a"; "b"; "c"] 1)
