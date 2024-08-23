type 'a mult_tree = T of 'a * 'a mult_tree list

let prepend_bottom_up (T (_c, _sub)) l =
  (* Placeholder function that currently just returns the list unchanged *)
  l

let bottom_up t = prepend_bottom_up t []
