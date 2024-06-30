let _ = Alcotest.(check (list string)) "compress non-empty list" 
  ["a"; "b"; "c"; "a"; "d"; "e"] 
  (compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])

let _ = Alcotest.(check (list string)) "compress empty list" [] (compress [])
