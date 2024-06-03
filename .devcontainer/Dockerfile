# Use the official OCaml image
FROM ocaml/opam:ubuntu-22.04-ocaml-4.14

# Install system dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    build-essential

# Set up OPAM and install OCaml packages
RUN opam init -y --disable-sandboxing && \
    opam switch create 4.14.0 && \
    eval $(opam env) && \
    opam install -y dune ounit

# Copy the repository into the container
COPY . /workspace
WORKDIR /workspace

# Set permissions for setup scripts
RUN chmod +x setup_codespaces.sh && chmod +x setup_exercise.sh

# Run the setup script
RUN ./setup_codespaces.sh
