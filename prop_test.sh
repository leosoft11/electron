#/bin/sh

#bash prop_test.sh lukast node 2 wepay.client_secret test
  
SANDBOX=$1
APP=$2
HIVE=${3:-1}
TEST=${4}
VALUE=${5}

POD=$(kubectl get pod -n "sandbox-$SANDBOX" -l "app=$APP,hive=eu-fra$HIVE" -o jsonpath='{.items[].metadata.name}')

kubectl -n "sandbox-$SANDBOX" exec -it $POD -c "${APP}" -- bash -c "sed -i  's/\(^${TEST} = \).*/\1${VALUE}/' /opt/service-conf/'${APP}'.properties"