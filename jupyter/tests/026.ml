let _ = Alcotest.(check (list (list string))) "extract nil"
  [[]]
  (extract 0 ["a"])

let _ = Alcotest.(check (list (list string))) "extract cons"
  [["a"; "b"]; ["a"; "c"]; ["a"; "d"]; ["b"; "c"]; ["b"; "d"]; ["c"; "d"]]
  (extract 2 ["a"; "b"; "c"; "d"])
