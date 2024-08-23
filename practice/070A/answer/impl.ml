type 'a mult_tree = T of 'a * 'a mult_tree list

let rec add_string_of_tree buf (T (c, sub)) =
  Buffer.add_char buf c;
  List.iter (add_string_of_tree buf) sub;
  Buffer.add_char buf '^'

let string_of_tree t =
  let buf = Buffer.create 128 in
  add_string_of_tree buf t;
  Buffer.contents buf
  let tree_of_string str =
    let len = String.length str in
    let rec aux pos =
      if pos >= len then failwith "Invalid string: reached end of string unexpectedly"
      else
        match str.[pos] with
        | '^' -> (None, pos + 1)
        | c ->
          let (children, next_pos) = aux_list (pos + 1) in
          (Some (T (c, children)), next_pos)
    and aux_list pos =
      if pos >= len then ([], pos)
      else
        match aux pos with
        | (None, next_pos) -> ([], next_pos)
        | (Some child, next_pos) ->
          let (rest, final_pos) = aux_list next_pos in
          (child :: rest, final_pos)
    in
    match aux 0 with
    | (Some tree, pos) when pos = len -> tree
    | _ -> failwith ("Invalid string: " ^ str)
  