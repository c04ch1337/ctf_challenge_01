#!/bin/bash

# Check if the container name is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <container_name>"
    exit 1
fi

CONTAINER_NAME=$1

# Define the base directory for the CTF Challenge files inside the container
BASE_DIR="/var/www/html"

# Define the expected flags and their locations
declare -A FLAGS=(
    ["CTF{flag1_sql_injection}"]="${BASE_DIR}/login.php"
    ["CTF{flag2_hidden_directory}"]="${BASE_DIR}/secret/flag2.txt"
    ["CTF{flag3_file_inclusion}"]="${BASE_DIR}/search.php"
    ["CTF{flag4_base64_encoded}"]="${BASE_DIR}/flag4.txt"
    ["CTF{flag5_weak_security_header}"]="${BASE_DIR}/admin/panel.php"
    ["CTF{flag6_weak_password_hash}"]="${BASE_DIR}/flag6.txt"
    ["CTF{flag7_command_injection}"]="${BASE_DIR}/admin/panel.php"
    ["CTF{flag8_response_header}"]="${BASE_DIR}/flag8.txt"
    ["CTF{flag9_ssti_vulnerability}"]="${BASE_DIR}/flag9.txt"
    ["CTF{flag10_jwt_token}"]="${BASE_DIR}/flag10.txt"
)

# Function to check if a flag exists and matches the expected value
check_flag() {
    local expected_flag=$1
    local flag_location=$2

    # Check if the file exists in the container
    if docker exec "$CONTAINER_NAME" test -f "$flag_location"; then
        # Get the flag content from the container
        local flag_content=$(docker exec "$CONTAINER_NAME" cat "$flag_location")
        if [[ "$flag_content" == "$expected_flag" ]]; then
            echo "[✓] Flag found and matches: $expected_flag (Location: $flag_location)"
        else
            echo "[✗] Flag content mismatch: Expected '$expected_flag', found '$flag_content' (Location: $flag_location)"
        fi
    else
        echo "[✗] Flag file not found: $flag_location"
    fi
}

# Check all flags
echo "Checking flags in container: $CONTAINER_NAME..."
for flag in "${!FLAGS[@]}"; do
    check_flag "$flag" "${FLAGS[$flag]}"
done

echo "Flag check complete."
