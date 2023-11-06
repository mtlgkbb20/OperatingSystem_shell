pathname=${1:-$PWD}

oldest_file=$(find "$pathname" -type f -printf '%T+ %p\n' | sort | head -n 1 | cut -d ' ' -f 2)

if [ -n "$oldest_file" ]; then
        echo "Do you want to delete $oldest_file? (y/n):"
        read response
        if [ "$response" == "y" ]; then
                rm "$oldest_file"

                echo "1 file deleted"
        fi
else
        echo "No files found to delete."
fi
~                                  