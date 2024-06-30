let _ = Alcotest.(check int) "random select 3"
  3
  (List.length (rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3))

let _ = Alcotest.(check int) "random select 5"
  5
  (List.length (rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 5))
