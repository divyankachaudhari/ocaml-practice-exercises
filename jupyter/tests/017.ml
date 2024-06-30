let _ = Alcotest.(check (pair (list string) (list string))) "split into two parts"
  (["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"])
  (split ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3)

let _ = Alcotest.(check (pair (list string) (list string))) "first part longer than list"
  (["a"; "b"; "c"; "d"], [])
  (split ["a"; "b"; "c"; "d"] 5)

let _ = Alcotest.(check (pair (list string) (list string))) "empty list"
  ([], [])
  (split [] 3)

let _ = Alcotest.(check (pair (list string) (list string))) "split at 0"
  ([], ["a"; "b"; "c"; "d"])
  (split ["a"; "b"; "c"; "d"] 0)

let _ = Alcotest.(check (pair (list string) (list string))) "split at list's length"
  (["a"; "b"; "c"; "d"], [])
  (split ["a"; "b"; "c"; "d"] 4)
