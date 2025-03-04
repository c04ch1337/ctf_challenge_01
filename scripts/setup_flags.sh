#!/bin/bash
# Hide flags in the web directory
echo "Setting up flags..."
echo "CTF{flag2_hidden_directory}" > /var/www/html/secret/flag2.txt
echo "CTF{flag4_base64_encoded}" > /var/www/html/flag4.txt
echo "CTF{flag6_weak_password_hash}" /var/www/html/flag6.txt
# Add more flags as needed
