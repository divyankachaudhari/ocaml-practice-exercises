let _ = Alcotest.(check (list (variant [pair int string; string]))) "encode non-empty list"
  [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")]
  (encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])

let _ = Alcotest.(check (list (variant [pair int string; string]))) "encode empty list" 
  [] 
  (encode [])
