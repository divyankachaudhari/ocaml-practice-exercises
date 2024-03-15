# Run the script
# chmod +x sync_practice.sh # run this only once
# ./sync_practice.sh

git remote add upstream https://github.com/ocaml/ocaml.org.git
git fetch upstream
git checkout upstream/main -- practice
