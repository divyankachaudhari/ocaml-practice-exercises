let _ = Alcotest.(check (list (pair int string))) "encode non-empty list"
  [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
  (encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])

let _ = Alcotest.(check (list (pair int string))) "encode empty list" [] (encode [])
