let _ = Alcotest.(check (list (pair int (pair int int)))) "goldbach_list from 9 to 20"
  [(10, (3, 7)); (12, (5, 7)); (14, (3, 11)); (16, (3, 13)); (18, (5, 13)); (20, (3, 17))]
  (goldbach_list 9 20)
