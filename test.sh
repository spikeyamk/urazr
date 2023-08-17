#!/bin/bash

# Define ANSI escape codes for colors
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

PROGRAM_NAME="./main"

MAX_POWER=22

# Calculate log base 2 using bc
calculate_log2() {
    echo "l($1)/l(2)" | bc -l
}

format_bytes() {
    local bytes=$1
    if (( bytes < 1024 )); then
        echo "${bytes} B"
    elif (( bytes < 1048576 )); then
        echo "$((bytes / 1024)) KiB"
    elif (( bytes < 1073741824 )); then
        echo "$((bytes / 1024 / 1024)) MiB"
    else
        echo "$((bytes / 1024 / 1024 / 1024)) GiB"
    fi
}

for ((i = 0; i <= MAX_POWER; i++)); do
    value=$((2 ** i))
    random_bytes_len=$(eval "$PROGRAM_NAME $value" | wc -c)

    status=""
    if [[ $random_bytes_len == $value ]]; then
        status="${GREEN}Success${RESET}"
    else
        status="${RED}ERROR${RESET}"
    fi

    formatted_bytes=$(format_bytes $random_bytes_len)
    printf "%b%s%b: " "$status"
    printf "%s %-4s %-10s %s %s\n" "$(printf "$PROGRAM_NAME generated:")" "$(calculate_log2 "$random_bytes_len" | sed 's/\.[0-9].*//' | sed 's/^/2\^/')" "= $formatted_bytes" "$(printf "($random_bytes_len bytes)")"
done
