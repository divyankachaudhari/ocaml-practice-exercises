# Use an official OCaml image as a parent image
FROM ocaml/opam:ubuntu-ocaml-4.14

# Switch to root to install system packages
USER root

# Install Python, pip, and virtual environment tools
RUN sudo apt-get update && sudo apt-get install -y python3-pip python3-venv

# Install system dependencies required by OCaml packages and Jupyter
RUN sudo apt-get install -y pkg-config libgmp-dev libzmq3-dev

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate virtual environment and install Jupyter
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install jupyter

# Switch back to the opam user and prepare the environment
USER opam
RUN opam update

# Set up the OCaml Jupyter kernel
RUN opam install jupyter ocamlfind ounit2
RUN opam exec -- ocaml-jupyter-opam-genspec

# Expose the port Jupyter will run on
EXPOSE 8888

# Set a working directory
WORKDIR /home/opam/work

# Start the Jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
