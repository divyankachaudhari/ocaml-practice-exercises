let _ = Alcotest.(check (list (list string))) "length_sort empty list"
  [[]]
  (length_sort [[]])

let _ = Alcotest.(check (list (list string))) "length_sort"
  [["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"]; ["f"; "g"; "h"]; ["i"; "j"; "k"; "l"]]
  (length_sort [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"]; ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]])
