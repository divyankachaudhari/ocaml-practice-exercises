let rec diag seq_seq () =
    let hds, tls = Seq.filter_map Seq.uncons seq_seq |> Seq.split in
    let hd, tl = Seq.uncons hds |> Option.map fst, Seq.uncons tls |> Option.map snd in
    let d = Option.fold ~none:Seq.empty ~some:diag tl in
    Option.fold ~none:Fun.id ~some:Seq.cons hd d ()