{ pkgs }: {
  deps = [
    pkgs.ocaml
    pkgs.ocamlPackages.opam
    pkgs.ocamlPackages.dune
    pkgs.ocamlPackages.ounit
  ];
}
