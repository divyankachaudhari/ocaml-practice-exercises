let _ = Alcotest.(check bool) "is_palindrome for palindrome list" true (is_palindrome ["x"; "a"; "m"; "a"; "x"])
let _ = Alcotest.(check bool) "is_palindrome for non-palindrome list" false (is_palindrome ["a"; "b"])
let _ = Alcotest.(check bool) "is_palindrome for empty list" true (is_palindrome [])
