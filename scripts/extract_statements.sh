#!/bin/bash

# Output file
OUTPUT="Compiled_Statements.md"
echo "# Compiled Exercise Statements" > "$OUTPUT"

# Directory containing the markdown files
EXERCISES_DIR="exercises"

# Process each markdown file
for mdfile in "$EXERCISES_DIR"/*.md; do
    # Extract the slug from the filename or metadata
    SLUG=$(awk -F': ' '/slug:/{print $2}' $mdfile | tr -d '"' | tr -d ' ')

    # Check if the slug is purely numerical and format accordingly
    if [[ "$SLUG" =~ ^[0-9]+$ ]]; then
        SLUG=$(printf "%03d" "$SLUG")
    fi

    # Extract the title
    TITLE=$(awk -F': ' '/title:/{print $2}' $mdfile | tr -d '"')

    # Extract the statement section, excluding the '# Statement' line
    awk '/# Statement/{flag=1; next} /^```$/{flag=0} flag' $mdfile > temp_statement.md
    # Check if temp_statement.md ends with ```
    if ! tail -1 temp_statement.md | grep -q '```'; then
        echo '```' >> temp_statement.md
    fi

    # Append to the compiled statements file
    echo "## Problem $SLUG: $TITLE" >> "$OUTPUT"  # Use '##' for secondary headings
    cat temp_statement.md >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "[Start working on this problem: $SLUG](practice/$SLUG/work/impl.ml)" >> "$OUTPUT"
    echo "" >> "$OUTPUT"  # Ensure spacing for readability
done

# Remove temporary file
rm temp_statement.md
