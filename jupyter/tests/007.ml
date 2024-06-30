type 'a node = One of 'a | Many of 'a node list

let _ = Alcotest.(check (list string)) "flatten non-empty list" 
  ["a"; "b"; "c"; "d"; "e"] 
  (flatten [One "a"; Many [One "b"; Many [One "c"; One "d"]; One "e"]])

let _ = Alcotest.(check (list string)) "flatten empty list" [] (flatten [])
