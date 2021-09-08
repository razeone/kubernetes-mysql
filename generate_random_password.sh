#!/bin/bash

# Generar un password aleatorio
RANDOM_PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')

echo "Random generated password: $RANDOM_PASSWORD"

# Cifrarlo en base 64
RANDOM_PASSWORD=$(echo $RANDOM_PASSWORD | base64)

# Agregarlo al archivo
echo "data:" >> mysql-secret.yml
echo "  password: $RANDOM_PASSWORD" >> mysql-secret.yml
echo "Base64 Encoded password: $RANDOM_PASSWORD"