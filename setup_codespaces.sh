#!/bin/bash

# Initialize OPAM and switch to the correct OCaml version
opam init -y --disable-sandboxing
eval $(opam env)
opam switch create 4.14.0
eval $(opam env)

# Install required OCaml packages
opam install -y dune ounit

# Make sure setup_exercise.sh is executable
chmod +x setup_exercise.sh
