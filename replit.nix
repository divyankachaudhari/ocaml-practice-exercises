{ pkgs }: {
  deps = [
    pkgs.ocaml
    pkgs.ocamlPackages.opam
    pkgs.ocamlPackages.dune
    pkgs.ocamlPackages.ocamlfind
    pkgs.ocamlPackages.ounit
    pkgs.ocamlPackages.curly
    pkgs.ocaml-lsp-server
  ];

  shellHook = ''
    export OPAMYES=1
    opam init --disable-sandboxing --bare
    opam switch create . ocaml-base-compiler.4.14.0
    eval $(opam env)
    opam install dune ounit2 ocaml-lsp-server ocamlformat curly
  '';
}
