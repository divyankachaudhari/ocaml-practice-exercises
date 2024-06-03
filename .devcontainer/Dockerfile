FROM debian:latest
RUN apt-get update && apt-get -y install sudo
RUN useradd -m -s /bin/bash -G sudo anonymous && echo 'anonymous ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER anonymous
WORKDIR /home/anonymous

RUN sudo apt-get install -y --no-install-recommends git opam ca-certificates

RUN opam init -ya --disable-sandboxing

ENV CAML_LD_LIBRARY_PATH=/home/anonymous/.opam/default/lib/stublibs:/home/anonymous/.opam/default/lib/ocaml/stublibs:/home/anonymous/.opam/default/lib/ocaml
ENV OCAML_TOPLEVEL_PATH=/home/anonymous/.opam/default/lib/toplevel
ENV MANPATH=:/home/anonymous/.opam/default/man
ENV OPAM_SWITCH_PREFIX=/home/anonymous/.opam/default
ENV PATH=/home/anonymous/.opam/default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN opam install -y ocaml-lsp-server ocamlformat utop ounit2 curly
