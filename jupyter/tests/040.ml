let _ = Alcotest.(check (pair int int)) "goldbach of 4"
  (2, 2)
  (goldbach 4)

let _ = Alcotest.(check (pair int int)) "goldbach of 28"
  (5, 23)
  (goldbach 28)
