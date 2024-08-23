# Statement

First of all, consult a good book on discrete mathematics or algorithms
for a detailed description of Huffman codes (you can start with the
[Wikipedia page](http://en.wikipedia.org/wiki/Huffman_coding))!

We consider a set of symbols with their frequencies.
For example, if the alphabet is `"a"`,..., `"f"`
(represented as the positions 0,...5) and
respective frequencies are 45, 13, 12, 16, 9, 5:

```ocaml
# let fs = [("a", 45); ("b", 13); ("c", 12); ("d", 16);
          ("e", 9); ("f", 5)];;
val fs : (string * int) list =
  [("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5)]
```

Our objective is to construct the
Huffman code `c` word for all symbols `s`. In our example, the result could
be
`hs = [("a", "0"); ("b", "101"); ("c", "100"); ("d", "111");
("e", "1101"); ("f", "1100")]`
(or `hs = [("a", "1");...]`). The task shall be performed by the function
`huffman` defined as follows: `huffman(fs)` returns the Huffman code
table for the frequency table `fs`

```ocaml
# huffman fs;;
- : (string * string) list =
[("a", "0"); ("c", "100"); ("b", "101"); ("f", "1100"); ("e", "1101");
 ("d", "111")]
```