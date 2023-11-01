st_input="$1"
shifting="$2"

new_string=""

for ((i=0;i<${#st_input};i++)); do
	char="${st_input:i:i+1}"
	asciichar=$(printf "%d" "'$char\n")
	sum=$((asciichar+shifting-97))
	if [ $sum -gt 25 ]; then
		sum=$((sum % 26))
	fi
	new_char=$(printf "\\$(printf '%03o' "$((sum+97))")\n")	
	new_string+="$new_char"
done

echo "$new_string"
