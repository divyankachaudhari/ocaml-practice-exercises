type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree

let leaves t =
    let rec loop t acc = match t with
    | Empty -> acc
    | Node (x, Empty, Empty) -> [x]
    | Node (_, l, r) -> loop l (loop r acc)
  in
  loop t []
