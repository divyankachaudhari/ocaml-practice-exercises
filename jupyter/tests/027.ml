let _ = Alcotest.(check (list (list (list string)))) "group empty group"
  [[]]
  (group [] [])

let _ = Alcotest.(check (list (list (list string)))) "group"
  [[["a"; "b"]; ["c"]]; [["a"; "c"]; ["b"]]; [["b"; "c"]; ["a"]];
   [["a"; "b"]; ["d"]]; [["a"; "c"]; ["d"]]; [["b"; "c"]; ["d"]];
   [["a"; "d"]; ["b"]]; [["b"; "d"]; ["a"]]; [["a"; "d"]; ["c"]];
   [["b"; "d"]; ["c"]]; [["c"; "d"]; ["a"]]; [["c"; "d"]; ["b"]]]
  (group ["a"; "b"; "c"; "d"] [2; 1])
