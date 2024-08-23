let full_words =
  let digit = [|"zero"; "one"; "two"; "three"; "four"; "five"; "six";
                "seven"; "eight"; "nine"|] in
  let rec words w n =
    if n = 0 then (match w with [] -> [digit.(0)] | _ -> w)
    else words (digit.(n mod 10) :: w) (n / 10)
  in
  fun n -> String.concat "-" (words [] n)
