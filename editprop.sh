#/bin/sh

#bash editprop.sh 86530v1 node 3 1
  
SANDBOX=$1
APP=$2
HIVE=${3:-1}
TEST=${4}

POD=$(kubectl get pod -n "sandbox-$SANDBOX" -l "app=$APP,hive=eu-fra$HIVE" -o jsonpath='{.items[].metadata.name}')

kubectl -n "sandbox-$SANDBOX" exec -it $POD -c "${APP}" -- bash -c 'echo '${TEST}' >> /opt/service-conf/'${APP}'.properties'
