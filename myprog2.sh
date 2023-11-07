#takes the input
st_input="$1"
shifting="$2"

new_string=""

for ((i=0;i<${#st_input};i++)); do
	# declares the variables
	char="${st_input:i:i+1}"
	asciichar=$(printf "%d" "'$char\n")
	num_digit=${#shifting}
 	#case 1
	if (( num_digit == 1 )); then
		sum=$((asciichar+shifting-97))
		if [ $sum -gt 25 ]; then
			sum=$((sum % 26))
		fi
		new_char=$(printf "\\$(printf '%03o' "$((sum+97))")\n")	
		new_string+="$new_char"
	# invalid case
 	elif (( num_digit == 0 )); then
		echo "write a valid integer"
		exit 1
  	#case 2
	else (( num_digit >= 2 ))
		shift_num="${shifting:i:1}"
		echo "${shift_num}"
		sum=$((asciichar+shift_num-97))
		if [ $sum -gt 25 ]; then
			sum=$((sum % 26))
		fi
		new_char=$(printf "\\$(printf '%03o' "$((sum+97))")\n")	
		new_string+="$new_char"
	fi
done

echo "$new_string"
