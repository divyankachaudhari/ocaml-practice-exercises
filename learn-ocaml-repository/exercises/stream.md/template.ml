type 'a cons = Cons of 'a * 'a stream
and 'a stream = unit -> 'a cons

let hd (seq : 'a stream) = let (Cons (x, _)) = seq () in x
let tl (seq : 'a stream) = let (Cons (_, seq)) = seq () in seq
let rec take n seq = if n = 0 then [] else let (Cons (x, seq)) = seq () in x :: take (n - 1) seq
let rec unfold f x () = let (y, x) = f x in Cons (y, unfold f x)
let bang x = unfold (fun x -> (x, x)) x
let ints x = unfold (fun x -> (x, x + 1)) x
let rec map f seq () = let (Cons (x, seq)) = seq () in Cons (f x, map f seq)
let rec filter p seq () = let (Cons (x, seq)) = seq () in let seq = filter p seq in if p x then Cons (x, seq) else seq ()
let rec iter f seq = let (Cons (x, seq)) = seq () in f x; iter f seq
let to_seq seq = Seq.unfold (fun seq -> Some (hd seq, tl seq)) seq
let rec of_seq seq () = match seq () with
| Seq.Nil -> failwith "Not a infinite sequence"
| Seq.Cons (x, seq) -> Cons (x, of_seq seq)