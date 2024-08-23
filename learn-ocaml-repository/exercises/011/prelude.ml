type 'a rle =
  | One of 'a
  | Many of int * 'a
