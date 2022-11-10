#!/bin/bash

# Generar un password aleatorio
RANDOM_ROOT_PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')

echo "Random generated root password: $RANDOM_ROOT_PASSWORD"
echo -n "$RANDOM_ROOT_PASSWORD" | base64 > ./password.txt
echo "Password saved to ./password.txt"

