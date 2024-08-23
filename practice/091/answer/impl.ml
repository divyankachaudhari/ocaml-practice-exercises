let possible row col used_rows usedD1 usedD2 =
  not (List.mem row used_rows
       || List.mem (row + col) usedD1
       || List.mem (row - col) usedD2)

let queens_positions n =
  let rec aux row col used_rows usedD1 usedD2 =
    if col > n then [List.rev used_rows]
    else
      (if row < n then aux (row + 1) col used_rows usedD1 usedD2
       else [])
      @ (if possible row col used_rows usedD1 usedD2 then
           aux 1 (col + 1) (row :: used_rows) (row + col :: usedD1)
               (row - col :: usedD2)
         else [])
  in aux 1 1 [] [] []
