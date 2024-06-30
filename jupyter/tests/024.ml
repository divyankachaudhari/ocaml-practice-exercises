let _ = Alcotest.(check (list int)) "lotto_select nil"
  []
  (lotto_select 0 0)

let _ = Alcotest.(check (list int)) "lotto_select cons"
  [20; 28; 45; 16; 24; 38] (* Note: this specific output is assumed for demonstration; actual output may vary *)
  (lotto_select 6 49)
