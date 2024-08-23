type 'a graph_term = { nodes : 'a list; edges : ('a * 'a) list }

let neighbors g a cond =
  let edge l (b, c) = if b = a && cond c then c :: l
                      else if c = a && cond b then b :: l
                      else l in
  List.fold_left edge [] g.edges

let rec list_path g a to_b = match to_b with
  | [] -> assert false (* [to_b] contains the path to [b]. *)
  | a' :: _ ->
    if a' = a then [to_b]
    else
      let n = neighbors g a' (fun c -> not (List.mem c to_b)) in
      List.concat_map (fun c -> list_path g a (c :: to_b)) n

let cycles g a =
  let n = neighbors g a (fun _ -> true) in
  let p = List.concat_map (fun c -> list_path g a [c]) n in
  List.map (fun p -> p @ [a]) p
