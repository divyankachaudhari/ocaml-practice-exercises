type 'a mult_tree = T of 'a * 'a mult_tree list

let rec ipl_sub len (T(_, sub)) =
  List.fold_left (fun sum t -> sum + ipl_sub (len + 1) t) len sub

let ipl t = ipl_sub 0 t
