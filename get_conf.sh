#/bin/sh

#bash get_conf.sh lukast node 3
  
SANDBOX=$1
APP=$2
HIVE=${3:-1}

POD=$(kubectl get pod -n "sandbox-$SANDBOX" -l "app=$APP,hive=eu-fra$HIVE" -o jsonpath='{.items[].metadata.name}')

kubectl -n "sandbox-$SANDBOX" exec -it $POD -c "${APP}" -- bash -c "cat /opt/service-conf/'${APP}'.properties"