#!/bin/bash

kubectl apply -f mysql-pv.yml
kubectl apply -f mysql-deployment.yml

sleep 10

kubectl get pods