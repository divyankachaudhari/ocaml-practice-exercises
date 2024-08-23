type 'a mult_tree = T of 'a * 'a mult_tree list

let rec count_nodes (T (_, sub)) =
  List.fold_left (fun n t -> n + count_nodes t) 1 sub
