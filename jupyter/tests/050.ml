let _ = Alcotest.(check (list (pair string string))) "Huffman code test"
  [("a", "0"); ("c", "100"); ("b", "101"); ("f", "1100"); ("e", "1101"); ("d", "111")]
  (huffman [("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5)])
