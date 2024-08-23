
Find the N'th element of a list.

**Remark:** OCaml has `List.nth` which numbers elements from `0` and
raises an exception if the index is out of bounds.

```ocaml
# List.nth ["a"; "b"; "c"; "d"; "e"] 2;;
- : string = "c"
# List.nth ["a"] 2;;
Exception: Failure "nth".
```
