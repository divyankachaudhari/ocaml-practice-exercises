# Statement

Flatten a nested list structure.

```ocaml
type 'a node =
  | One of 'a 
  | Many of 'a node list
```

```ocaml
# flatten [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]];;
- : string list = ["a"; "b"; "c"; "d"; "e"]
```