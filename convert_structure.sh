#!/bin/bash

EXERCISE_DIR="practice"
SHARED_DIR="shared"
TEST_DIR="test"
COMMON_FILES=("dune" "dune-project")

# Create shared directory and subdirectories
mkdir -p "$SHARED_DIR/$TEST_DIR"

# Move common files to shared directory
for file in "${COMMON_FILES[@]}"; do
  if [ -f "$EXERCISE_DIR/001/$file" ]; then
    mv "$EXERCISE_DIR/001/$file" "$SHARED_DIR/"
  fi
done

# Move common test files to shared test directory
if [ -d "$EXERCISE_DIR/001/work/$TEST_DIR" ]; then
  mv "$EXERCISE_DIR/001/work/$TEST_DIR"/* "$SHARED_DIR/$TEST_DIR/"
fi

# Iterate over each exercise directory
for exercise in "$EXERCISE_DIR"/*; do
  if [ -d "$exercise" ]; then
    exercise_number=$(basename "$exercise")

    # Remove common files from each exercise directory
    for file in "${COMMON_FILES[@]}"; do
      if [ -f "$exercise/$file" ]; then
        rm "$exercise/$file"
      fi
    done

    # Remove common test files from each exercise directory
    if [ -d "$exercise/work/$TEST_DIR" ]; then
      rm -rf "$exercise/work/$TEST_DIR"
    fi
    if [ -d "$exercise/answer/$TEST_DIR" ]; then
      rm -rf "$exercise/answer/$TEST_DIR"
    fi
  fi
done

echo "Directory structure converted successfully."
