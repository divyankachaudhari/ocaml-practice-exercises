type 'a mult_tree = T of 'a * 'a mult_tree list

let rec prepend_bottom_up (T (c, sub)) l =
  List.fold_right (fun t l -> prepend_bottom_up t l) sub (c :: l)

let bottom_up t = prepend_bottom_up t []
