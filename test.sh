#!/bin/bash

//bash test.sh testimex01 node 3

#/bin/sh
  
SANDBOX=$1
APP=$2
HIVE=${3:-1}

POD=$(kubectl get pod -n "sandbox-$SANDBOX" -l "app=$APP,hive=eu-fra$HIVE" -o jsonpath='{.items[].metadata.name}')

kubectl -n "sandbox-$SANDBOX" exec -it $POD -c $APP kill 1