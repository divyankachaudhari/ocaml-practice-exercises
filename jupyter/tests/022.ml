let _ = Alcotest.(check (list int)) "range ascending order"
  [4; 5; 6; 7; 8; 9]
  (range 4 9)

let _ = Alcotest.(check (list int)) "range descending order"
  [9; 8; 7; 6; 5; 4]
  (range 9 4)

let _ = Alcotest.(check (list int)) "range equal boundaries"
  [4]
  (range 4 4)
