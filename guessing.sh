#!/bin/bash

echo "Welcome! This is a guess game."

function read_input() {
    read -p "Please guess a random number between 1 and 10: " input

    # Check if input contains non-numeric characters
    if echo "$input" | grep -q '[^0-9]'; then
        echo "Error: Please enter a numeric value"
        read_input
    fi
}

read_input

random_number=$((1 + $RANDOM % 10))

while true; do
    if [ "$input" == "$random_number" ]; then
        echo "Your guess is correct"
        break
    elif [ "$input" -ne "$random_number" ]; then
        if [ "$input" -gt "$random_number" ]; then
            echo "Your guess is too high"
            read_input
        fi
        if [ "$input" -lt "$random_number" ]; then
            echo "Your guess is too low"
            read_input
        fi
    else
        break
    fi
done
