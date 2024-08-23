type 'a mult_tree = T of 'a * 'a mult_tree list

let rec add_lispy buf = function
  | T(c, []) -> Buffer.add_char buf c
  | T(c, sub) ->
     Buffer.add_char buf '(';
     Buffer.add_char buf c;
     List.iter (fun t -> Buffer.add_char buf ' '; add_lispy buf t) sub;
     Buffer.add_char buf ')'

let lispy t =
  let buf = Buffer.create 128 in
  add_lispy buf t;
  Buffer.contents buf
