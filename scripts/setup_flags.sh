#!/bin/bash
# Hide flags in the web directory
echo "Setting up flags..."
echo "CTF{flag2_hidden_directory}" > /var/www/html/secret/flag2.txt
echo "CTF{flag3_file_inclusion}" > /var/www/html/flag3.txt
echo "CTF{flag4_base64_encoded}" > /var/www/html/flag4.txt
echo "CTF{flag6_weak_password_hash}" > /var/www/html/flag6.txt
echo "CTF{flag8_response_header}" > /var/www/html/flag8.txt
echo "CTF{flag9_ssti_vulnerability}" > /var/www/html/flag9.txt
echo "CTF{flag10_jwt_token}" > /var/www/html/flag10.txt
# Add more flags as needed
