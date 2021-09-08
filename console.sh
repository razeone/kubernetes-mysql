#!/bin/bash

# Get pod name based on app label
POD=$(kubectl get pod -l app=mysql -o jsonpath="{.items[0].metadata.name}")

# Connect to the pod
kubectl exec --stdin --tty $POD -- /bin/bash
