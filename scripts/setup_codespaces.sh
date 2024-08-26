#!/bin/bash

opam init -y --disable-sandboxing
eval $(opam env)
opam switch create 4.14.0
eval $(opam env)

opam install -y dune ounit

chmod +x setup_exercise.sh
