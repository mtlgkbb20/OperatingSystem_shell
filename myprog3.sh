
# The path provided by the user and if not specified, it defaults to the current directory.
pathname=${1:-$PWD}

# Finds and retrieves a list of files in the specified directory, orders them by time, and identifies the oldest file.
# Limits the depth to 1, ensuring that the search for the oldest file is restricted to the specified directory only.
oldest_file=$(find "$pathname" -maxdepth 1 -type f -printf '%T+ %p\n' | sort | head -n 1 | cut -d ' ' -f 2)

# If the oldest file is found, the script proceeds.
if [ -n "$oldest_file" ]; then
        echo "Do you want to delete $oldest_file= (y/n):"
        
        # Reads the users response.
        read response

        # Decides whether to delete the file based on the users response.
        if [ "$response" == "y" ]; then
                # Deletes the oldest file.
                rm "$oldest_file"

                echo "1 file deleted"
        fi
else
        echo "No files found to delete."
fi