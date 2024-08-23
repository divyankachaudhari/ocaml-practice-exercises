let rotate list n =
  let len = List.length list in
  (* Compute a rotation value between 0 and len - 1 *)
  let n = if len = 0 then 0 else (n mod len + len) mod len in
  if n = 0 then list
  else let a, b = split list n in b @ a
