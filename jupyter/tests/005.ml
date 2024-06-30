let _ = Alcotest.(check (list string)) "rev of empty list" [] (rev [])
let _ = Alcotest.(check (list string)) "rev of non-empty list" ["c"; "b"; "a"] (rev ["a"; "b"; "c"])
