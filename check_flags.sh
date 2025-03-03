#!/bin/bash

# Define the base directory for the CTF Challenge 3 files
BASE_DIR="/var/www/html"

# Define the expected flags and their locations
declare -A FLAGS=(
    ["CTF{sql_injection}"]="${BASE_DIR}/login.php"
    ["CTF{hidden_directory}"]="${BASE_DIR}/secret/flag2.txt"
    ["CTF{file_inclusion}"]="${BASE_DIR}/search.php"
    ["CTF{base64_encoded}"]="${BASE_DIR}/flag4.txt"
    ["CTF{weak_security_header}"]="${BASE_DIR}/admin/panel.php"
    ["CTF{weak_password_hash}"]="${BASE_DIR}/flag6.txt"
    ["CTF{command_injection}"]="${BASE_DIR}/admin/panel.php"
    ["CTF{response_header}"]="${BASE_DIR}/flag8.txt"
    ["CTF{ssti_vulnerability}"]="${BASE_DIR}/flag9.txt"
    ["CTF{jwt_token}"]="${BASE_DIR}/flag10.txt"
)

# Function to check if a flag exists and matches the expected value
check_flag() {
    local expected_flag=$1
    local flag_location=$2

    if [[ -f "$flag_location" ]]; then
        local flag_content=$(cat "$flag_location")
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
echo "Checking flags for The Phantom App..."
for flag in "${!FLAGS[@]}"; do
    check_flag "$flag" "${FLAGS[$flag]}"
done

echo "Flag check complete."
