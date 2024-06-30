let _ = Alcotest.(check (option int)) "last of empty list" None (last [])
let _ = Alcotest.(check (option string)) "last of non-empty list" (Some "d") (last ["a"; "b"; "c"; "d"])