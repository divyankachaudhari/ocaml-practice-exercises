let identifier =
  let is_letter c = 'a' <= c && c <= 'z' in
  let is_letter_or_digit c = is_letter c || ('0' <= c && c <= '9') in
  let rec is_valid s i not_after_dash =
    if i < 0 then not_after_dash
    else if is_letter_or_digit s.[i] then is_valid s (i - 1) true
    else if s.[i] = '-' && not_after_dash then is_valid s (i - 1) false
    else false in
  fun s -> (
      let n = String.length s in
    n > 0 && is_letter s.[n - 1] && is_valid s (n - 2) true);;