# Syncing the Practice Folder from `ocaml/ocaml.org`

To sync the `practice` folder with the latest updates from the `ocaml/ocaml.org` repository, follow these steps:

1. Add the original `ocaml/ocaml.org` repository as a remote (only needs to be done once):

   ```
   git remote add upstream https://github.com/ocaml/ocaml.org.git
   ```

2. Fetch the latest changes from the upstream repository:

   ```
   git fetch upstream
   ```

3. Check out the `practice` folder from the upstream's main branch into your local repository:

   ```
   git checkout upstream/main -- practice
   ```

After running these commands, the changes will be in your local repository. You can then commit and create a PR if necessary.
