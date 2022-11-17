#!/bin/bash

source .env

rhoas kafka create --name ${KAFKA_NAME} --wait
rhoas generate-config --type json --overwrite --output-file ${KAFKA_CONFIG_JSON}
rhoas context set-kafka --name ${KAFKA_NAME}

for TOPIC in 'items' 'customers' 'orders'
do
    rhoas kafka topic create --name ${TOPIC}
done

rhoas service-account create --output-file=./${SA_CRED_JSON} --file-format json --overwrite --short-description=${SA_NAME}
CLIENT_ID=$(grep clientID ./${SA_CRED_JSON} | cut -d ":" -f2 | tr -d '", ')

rhoas kafka acl grant-access --consumer \
    --service-account ${CLIENT_ID} --topic-prefix "ksql-topic" --group ${KAFKA_CONSUMER_GROUP} -y