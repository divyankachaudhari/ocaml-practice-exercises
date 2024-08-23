# Statement

Implement the so-called run-length encoding data compression method
directly. I.e. don't explicitly create the sublists containing the
duplicates, as in problem "[Pack consecutive duplicates of list elements into sublists](#9)", but only count them. As in problem
"[Modified run-length encoding](#10)", simplify the result list by replacing the singleton lists (1 X) by X.

```ocaml
# encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
- : string rle list =
[Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
 Many (4, "e")]
```