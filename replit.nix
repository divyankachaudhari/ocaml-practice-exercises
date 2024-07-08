{ pkgs }: {
  deps = [
    pkgs.ocamlPackages.ocaml
    pkgs.ocamlPackages.dune_3
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.curly
    pkgs.ocamlPackages.alcotest
  ];

  shellHook = ''
    export OPAMYES=1
    opam init --disable-sandboxing --bare
    opam switch create . ocaml-base-compiler.4.14.0
    eval $(opam env)
    opam install dune alcotest ocaml-lsp-server ocamlformat curly
  '';
}
