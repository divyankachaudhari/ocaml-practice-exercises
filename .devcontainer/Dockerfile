FROM debian:latest

# Install sudo and create a user
RUN apt-get update && apt-get -y install sudo
RUN useradd -m -s /bin/bash -G sudo anonymous && echo 'anonymous ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the new user
USER anonymous
WORKDIR /home/anonymous

# Install necessary packages
RUN sudo apt-get install -y --no-install-recommends git opam ca-certificates

# Initialize OPAM
RUN opam init -ya --disable-sandboxing

# Set environment variables
ENV CAML_LD_LIBRARY_PATH=/home/anonymous/.opam/default/lib/stublibs:/home/anonymous/.opam/default/lib/ocaml/stublibs:/home/anonymous/.opam/default/lib/ocaml
ENV OCAML_TOPLEVEL_PATH=/home/anonymous/.opam/default/lib/toplevel
ENV MANPATH=:/home/anonymous/.opam/default/man
ENV OPAM_SWITCH_PREFIX=/home/anonymous/.opam/default
ENV PATH=/home/anonymous/.opam/default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install OCaml packages
RUN opam install -y ocaml-lsp-server ocamlformat utop alcotest curly

# Copy and set permissions for setup scripts
COPY setup_codespaces.sh setup_exercise.sh /home/anonymous/
RUN chmod +x /home/anonymous/setup_codespaces.sh /home/anonymous/setup_exercise.sh

# Run the setup script
RUN /home/anonymous/setup_codespaces.sh
