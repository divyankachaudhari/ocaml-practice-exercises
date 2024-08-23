
The selected items shall be returned in a list. We use the `Random`
module but and initialise it with `Random.init 0` at the start of 
the function for reproducibility and validate the solution. To make the function truly random, however,
one should remove the call to `Random.init 0`

```ocaml
# rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["e"; "c"; "g"]
```
