let _ = Alcotest.(check int) "length of empty list" 0 (length [])
let _ = Alcotest.(check int) "length of non-empty list" 3 (length ["a"; "b"; "c"])
