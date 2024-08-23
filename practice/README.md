## Instruction for Learners

`cd` into the folder corresponding to the exercise you are willing to practice.

Run `dune build --root .`, it should compile without an error.

Run `dune test --root . answer`, it should pass, showing that there is a
solution to this exercise.

Hack your solution in the file `work/impl.ml`. Check it compiles by running
`dune build --root . `, check if it behaves as expected by running `dune test
--root . work`.

You are allowed to look at file `ex.ml`, it contains the test cases. That may help.

Don't look at the file `answer/impl.ml` it contains the solution.

## Instruction for Maintnainers

One XXX folder per exercise. Each is a standalone Dune project.

Each folder has this structure
```
XXX
├── answer
│   ├── impl.ml
│   └── test
│       ├── dune
│       └── run.ml
├── dune
├── dune-project
├── ex.ml
├── statement.md
└── work
    ├── impl.ml
    └── test
        ├── dune
        └── run.ml
```

File `statement.md` contains the exercice description

File `ex.ml` contains:
- Module type `Testable` the function to be implemented in the exercise
- Functor `Make` containing the test cases

File `answer/impl.ml` contains the reference answer to the exercise

File `work/impl.ml` contains a dummy definition, meant to be replaced
by the learner's solultion.

Files `test` folders should (hopefully) always be the sames

In this folder, run `make answer` to pass the tests on all answers, and `make clean` to delete all build artifacts.



