let _ = Alcotest.(check (list string)) "rotate 3 places left"
  ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
  (rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3)

let _ = Alcotest.(check (list string)) "rotate with negative n"
  ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
  (rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-5))

let _ = Alcotest.(check (list string)) "rotate more than length"
  ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
  (rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 11)

let _ = Alcotest.(check (list string)) "rotate zero places"
  ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"]
  (rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 0)

let _ = Alcotest.(check (list string)) "rotate empty list"
  []
  (rotate [] 3)
