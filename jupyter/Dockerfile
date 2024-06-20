# Use an official OCaml image as a parent image
FROM ocaml/opam:ubuntu-ocaml-4.14

# Switch to root to install system packages
USER root

# Install Python, pip, and virtual environment tools
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    git

# Install system dependencies required by OCaml packages and Jupyter
RUN apt-get install -y \
    pkg-config \
    libgmp-dev \
    libzmq3-dev

# Create a virtual environment in the opam user's home directory
RUN python3 -m venv /home/opam/venv

# Activate virtual environment and install Jupyter
ENV PATH="/home/opam/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install jupyter

# Switch back to the opam user and prepare the environment
USER opam
WORKDIR /home/opam

# Create the work directory
RUN mkdir -p /home/opam/work

# Setup Jupyter and OCaml Jupyter kernel
RUN opam update && \
    opam install jupyter ocamlfind ounit2 && \
    opam exec -- ocaml-jupyter-opam-genspec && \
    jupyter kernelspec install --user /home/opam/.opam/4.14/share/jupyter

# Expose the port Jupyter will run on
EXPOSE 8888

# Start the Jupyter notebook in the work directory
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--notebook-dir=/home/opam/work"]
