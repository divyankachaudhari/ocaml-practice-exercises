let _ = Alcotest.(check (list string)) "decode non-empty list"
  ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
  (decode [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")])

let _ = Alcotest.(check (list string)) "decode empty list" 
  [] 
  (decode [])
