open Alcotest

module type Testable = sig
  type 'a graph_term = { nodes : 'a list; edges : ('a * 'a) list }
  val paths : 'a graph_term -> 'a -> 'a -> 'a list list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let example_graph = 
    { nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
      edges = [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')] }

  let test_paths_f_to_b () =
    let expected = [['f'; 'c'; 'b']; ['f'; 'b']] in
    check (list (list char)) "paths f to b" expected (paths example_graph 'f' 'b')

  let test_paths_h_to_g () =
    let expected = [['h'; 'g']] in
    check (list (list char)) "paths h to g" expected (paths example_graph 'h' 'g')

  let test_paths_k_to_b () =
    let expected = [['k'; 'f'; 'c'; 'b']; ['k'; 'f'; 'b']] in
    check (list (list char)) "paths k to b" expected (paths example_graph 'k' 'b')

  let run () =
    run "Graph Path Tests" [
      "paths", [
        test_case "test_paths_f_to_b" `Quick test_paths_f_to_b;
        test_case "test_paths_h_to_g" `Quick test_paths_h_to_g;
        test_case "test_paths_k_to_b" `Quick test_paths_k_to_b;
      ]
    ]
end

module Work : Testable = Work.Impl
module Answer : Testable = Answer.Impl
