open Alcotest

module type Testable = sig
  type 'a graph_term = { nodes : 'a list; edges : ('a * 'a) list }
  val cycles : 'a graph_term -> 'a -> 'a list list
end

module Make(Tested: Testable) : sig val run : unit -> unit end = struct
  open Tested

  let example_graph =
    { nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
      edges = [('h', 'g'); ('k', 'f'); ('f', 'b'); ('f', 'c'); ('c', 'b')] }

  let test_cycles_works_correctly () =
    let expected_cycles = [
      ['f'; 'b'; 'c'; 'f'];
      ['f'; 'c'; 'f'];
      ['f'; 'c'; 'b'; 'f'];
      ['f'; 'b'; 'f'];
      ['f'; 'k'; 'f']
    ] in
    check (list (list char)) "cycles" expected_cycles (cycles example_graph 'f')

  let run () =
    let open Alcotest in
    run "Graph Cycles" [
      "cycles", [
        test_case "test_cycles_works_correctly" `Quick test_cycles_works_correctly;
      ]
    ]
end

module Work : Testable = struct
  include Work.Impl
end

module Answer : Testable = struct
  include Answer.Impl
end
