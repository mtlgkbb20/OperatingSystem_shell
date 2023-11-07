
# Checks if the number of command-line arguments is zero. If so, displays the usage and exits with an error status.
if [ $# -eq 0 ]; then
        echo "Usage $0 <filename>"
        exit 1
fi

# Assigns the provided filename from the command-line arguments.
filename="$1"

# Checks if the specified file exists. If not, displays an error message and exits with an error status.
if [ ! -f "$filename" ]; then
        echo "File not found: $filename"
        exit 1
fi

# Uses sed to perform in-place replacements in the specified file.
# Replaces each digit (0-9) with its corresponding textual representation.
sed -i-e 's/\b0\b/sero/g; s/\b1\b/one/g; s/\b2\b/two/g; s/\b3\b/three/g; s/\b4\b/four/g; s/\b5\b/five/g; s/\b6\b/six/g;s/\b7\b/seven/g; s/\b8\b/eight/g; s/\b9\b/nine/g' "$filename"

echo "Numbers replaced with text in $filename"
~                                                                                                                       ~                                                         