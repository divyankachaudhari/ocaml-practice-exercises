#!/bin/bash

EXERCISE_DIR="./practice"
DESCRIPTION_DIR="./exercises"

# List available exercises
echo "Available exercises:"
for dir in "$EXERCISE_DIR"/*; do
  if [ -d "$dir" ]; then
    exercise_number=$(basename "$dir")
    echo "$exercise_number"
  fi
done

# Prompt user to select an exercise
read -p "Enter the exercise number you want to work on: " exercise_number

# Check if the exercise folder exists
if [ ! -d "$EXERCISE_DIR/$exercise_number" ]; then
  echo "Exercise $exercise_number does not exist."
  exit 1
fi

# Determine the description file name
description_file=$(ls $DESCRIPTION_DIR/${exercise_number}_*.md 2>/dev/null)

# Display the exercise description
if [ -f "$description_file" ]; then
  cat "$description_file"
else
  echo "No description found for exercise $exercise_number."
fi

echo "Exercise $exercise_number setup complete. You can start working in the $EXERCISE_DIR/$exercise_number directory."

# Open the exercise directory in the default code editor (optional)
if command -v code &> /dev/null; then
  code "$EXERCISE_DIR/$exercise_number"
elif command -v subl &> /dev/null; then
  subl "$EXERCISE_DIR/$exercise_number"
elif command -v nano &> /dev/null; then
  nano "$EXERCISE_DIR/$exercise_number"
else
  echo "No supported code editor found. Open the $EXERCISE_DIR/$exercise_number directory manually."
fi
