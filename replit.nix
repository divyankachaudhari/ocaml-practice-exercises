{ pkgs }: {
  deps = [
    pkgs.ocamlPackages.ocaml
    pkgs.ocamlPackages.dune_3
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.curly
    pkgs.ocamlPackages.ounit2
  ];
}