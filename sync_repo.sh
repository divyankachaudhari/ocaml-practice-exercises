# Run the script
# chmod +x sync_practice.sh # run this only once
# ./sync_practice.sh

git remote add upstream https://github.com/ocaml/ocaml.org.git
git fetch upstream

mkdir -p temp_practice
git checkout upstream/main -- practice
mv practice temp_practice/

rsync -av --include '*/' --include '00[1-9]/' --include '0[1-9][0-9]/' --include '09[0-3]/' --exclude '*' temp_practice/practice/ .

rm -rf temp_practice
