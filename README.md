### README.md

---

# OCaml Practice Exercises

This repository contains practice exercises for learning OCaml. You can use this repository on various platforms: GitHub Codespaces, Replit, and locally with Jupyter Notebook or directly on your machine.

## Getting Started

### Prerequisites

- Git
- Docker (for local Jupyter Notebook setup)

### Clone the Repository

```sh
git clone https://github.com/divyankachaudhari/ocaml-practice-exercises.git
cd ocaml-practice-exercises
```

## Running Locally

- Ensure the setup scripts have execute permissions:

  ```sh
  chmod +x setup_exercise.sh
  ```

1. **Ensure OPAM and Dependencies Are Installed:**

   ```sh
   opam init -y --disable-sandboxing
   eval $(opam env)
   opam switch create 4.14.0
   eval $(opam env)
   opam install -y dune ounit
   ```

2. **Run the Setup Script:**

   ```sh
   ./setup_exercise.sh
   ```

## Using GitHub Codespaces

1. **Open in GitHub Codespaces:**
   - Navigate to your repository on GitHub.
   - Click the green "Code" button, select "Codespaces", and create a new codespace.

2. **Setup the Environment:**
   - Codespaces will automatically use the `.devcontainer` configuration to set up the environment.

3. **Run Exercises:**
  - Ensure the setup scripts have execute permissions:

      ```sh
      chmod +x setup_exercise.sh
      ```
   - Open the terminal in Codespaces and run:

     ```sh
     ./setup_exercise.sh
     ```

## Using Replit

1. **Import the Repository:**
   - Go to [Replit](https://replit.com/).
   - Click "Create", select "Import from GitHub", and enter your repository URL.

2. **Setup the Environment:**
   - Replit will use the `replit.nix` configuration to set up the environment.

3. **Run Exercises:**
   - Ensure the setup scripts have execute permissions:

      ```sh
      chmod +x setup_exercise.sh
      ```

   - Click the "Run" button on Replit to execute the setup script and follow the prompts:

     ```sh
     ./setup_exercise.sh
     ```


## Available Exercises

The exercises are located in the `practice` directory. Each exercise includes:

- `work/impl.ml`: Implementation template for you, the learner.
- `answer/impl.ml`: Reference solution.
- `ex.ml`: Function signatures and test cases.

Example usage `practice/008`: Run `dune build --root .` to compile and `dune test --root . work` to test your implementation against test cases.s

Exercise descriptions are in the `exercises` directory.

## Using Jupyter Notebook

Ensure that you've cloned `ocaml-practice-exercises` and are now in the repository.

1. **Navigate into `jupyter` folder**
   ```bash
   cd jupyter
   ``` 
2. **Build the Docker Image**: One time setup
   ```bash
   docker build -t ocaml-jupyter .
   ```
3. **Run the Docker Container**
   ```bash
   docker run -p 8888:8888 -v $(pwd):/home/opam/work ocaml-jupyter
   ```
4. **Access the Jupyter Notebook**
   - After running the container, you should see output in the terminal that includes a URL. It will look something like this:
      ```bash
      http://127.0.0.1:8888/tree
      ```
   - Copy this URL and paste it into your web browser's address bar. This will open the Jupyter Notebook interface where you can start working with OCaml notebooks.



