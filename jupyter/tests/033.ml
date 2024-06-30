let _ = Alcotest.(check bool) "coprime numbers" true (coprime 13 27)
let _ = Alcotest.(check bool) "not coprime numbers" false (coprime 20536 7826)
