#!/bin/bash

# Build and run the Docker container
echo "Building Docker container..."
docker-compose up -d

# Provide instructions
echo "CTF Challenge is running at http://localhost:81"
echo "Access DVWA at http://localhost/dvwa"
echo "Use 'docker-compose down' to stop the challenge."
