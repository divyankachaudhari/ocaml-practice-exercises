# Use the official OCaml image as the base image
FROM ocaml/opam:ubuntu-22.04-ocaml-4.14

# Install system dependencies
USER root
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    build-essential

# Set up OPAM and install OCaml packages
USER opam
RUN opam init -y --disable-sandboxing && \
    eval $(opam env) && \
    opam switch create 4.14.0 && \
    eval $(opam env) && \
    opam install -y dune ounit

# Set permissions for setup scripts
WORKDIR /workspace
COPY setup_codespaces.sh setup_exercise.sh /workspace/
RUN chmod +x setup_codespaces.sh setup_exercise.sh

# Run the setup script
RUN ./setup_codespaces.sh
