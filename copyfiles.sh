clear
# Function to copy files non-recursively in the current directory
copy_files() {
    wildcard="$1"
    dir="$2"
    find "$dir" -maxdepth 1 -type f -name "$wildcard" -exec mkdir -p "$dir"/copied \; -exec cp {} "$dir"/copied/ \;
}

# Function to copy files recursively in subdirectories
copy_files_recursive() {
    wildcard="$1"
    # Set the starting directory
	start_dir="."

	# Iterate through subdirectories one by one
	for dir in $(find $start_dir -type d); do
		
		echo "Visiting directory: $dir"
	    copy_files "$wildcard" "$dir"
		
	done
}

# Check for the number of arguments
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 [-R] <wildcard>"
    exit 1
fi

# Initialize options
recursive=false
wildcard=""

# Parse options
while getopts ":R" opt; do
    case $opt in
        R)
            recursive=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
    esac
done

# Get the wildcard argument
shift $((OPTIND - 1))
wildcard="$1"

if [ $recursive = true ]; then
    copy_files_recursive "$wildcard"
else
    copy_files "$wildcard" "."
fi


