# Statement

If you need so, refresh your memory about
[run-length encoding](http://en.wikipedia.org/wiki/Run-length_encoding).

Here is an example:

```ocaml
# encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : (int * string) list =
[(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
```