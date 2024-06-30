let _ = Alcotest.(check (option (pair string string))) "last_two of single-element list" None (last_two ["a"])
let _ = Alcotest.(check (option (pair string string))) "last_two of non-empty list" (Some ("c", "d")) (last_two ["a"; "b"; "c"; "d"])
