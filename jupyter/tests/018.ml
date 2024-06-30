let _ = Alcotest.(check (list string)) "slice from list"
  ["c"; "d"; "e"; "f"; "g"]
  (slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 2 6)

let _ = Alcotest.(check (list string)) "slice entire list"
  ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"]
  (slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 0 9)

let _ = Alcotest.(check (list string)) "slice with zero elements"
  []
  (slice ["a"; "b"; "c"; "d"] 2 1)

let _ = Alcotest.(check (list string)) "slice with indices beyond list length"
  []
  (slice ["a"; "b"; "c"; "d"] 4 5)
