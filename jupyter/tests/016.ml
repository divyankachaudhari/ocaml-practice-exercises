let _ = Alcotest.(check (list string)) "drop every 3rd from list" 
  ["a"; "b"; "d"; "e"; "g"; "h"; "j"] 
  (drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3)

let _ = Alcotest.(check (list string)) "drop with empty list" 
  [] 
  (drop [] 3)

let _ = Alcotest.(check (list string)) "drop with n larger than list length" 
  ["a"; "b"] 
  (drop ["a"; "b"] 3)

let _ = Alcotest.(check (list string)) "drop with n equal to 0 (edge case)" 
  ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 
  (drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 0)

let _ = Alcotest.(check (list string)) "drop with n equal to 1" 
  [] 
  (drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 1)
