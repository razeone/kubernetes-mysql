#!/bin/bash

kubectl delete svc mysql
kubectl delete deploy mysql
kubectl delete pvc mysql-pv-claim
kubectl delete pv mysql-pv-volume
kubectl delete secret mysql-pass