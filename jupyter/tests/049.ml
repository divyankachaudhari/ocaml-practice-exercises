let _ = Alcotest.(check (list string)) "gray code n = 1"
  ["0"; "1"]
  (gray 1)

let _ = Alcotest.(check (list string)) "gray code n = 2"
  ["00"; "01"; "11"; "10"]
  (gray 2)

let _ = Alcotest.(check (list string)) "gray code n = 3"
  ["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"]
  (gray 3)
