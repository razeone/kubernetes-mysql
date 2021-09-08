#!/bin/bash


RANDOM_PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')

echo "Random generated password: $RANDOM_PASSWORD"

RANDOM_PASSWORD=$(echo $RANDOM_PASSWORD | base64)

#echo "  password: $RANDOM_PASSWORD" >> mysql-secret.yml

echo "Base64 Encoded password: $RANDOM_PASSWORD"