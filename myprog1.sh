#checks if the input is valid or not
if [ $# -ne 0 ]; then
	echo "Usage: $1 <input_file>"
fi
input_file="$1"

if [ ! -f "$input_file" ]; then
	echo "File not found: $input_file"
	exit 1
fi

# declares a list
declare -a list=(0 0 0 0 0 0 0 0 0 0)

while read char; do
	#according to the char arrange the index
	if [[ "$char" =~ [0-9] ]]; then
		index=$((char))
		list[index]=$((list[index] + 1))
	fi
done < "$input_file"
#adds * for each number
for ((i=0;i<=9;i++)); do
	printf "$i:"
	for ((j=0;j<${list[i]};j++)); do
		printf "*"
	done
	echo ""
done
