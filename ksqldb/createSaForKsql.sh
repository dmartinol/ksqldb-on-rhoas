#!/bin/bash

source ../.env
source .env

rhoas service-account create --output-file=./ksqlsa-credentials.json --file-format json --overwrite --short-description=${KSQLSA_NAME}

KSQLCLIENT_ID=$(grep clientID ./ksqlsa-credentials.json | cut -d ":" -f2 | tr -d '", ')

rhoas kafka acl create --operation describe --service-account ${KSQLCLIENT_ID} --cluster --permission allow -y
rhoas kafka acl create --operation all --service-account ${KSQLCLIENT_ID} --group "_confluent-ksql-${KSQL_SERVICEID}" --prefix --permission allow -y
rhoas kafka acl create --operation all --service-account ${KSQLCLIENT_ID} --transactional-id ${KSQL_SERVICEID} --prefix --permission allow -y
rhoas kafka acl create --operation all --service-account ${KSQLCLIENT_ID} --group "${KSQLKAFKA_CONSUMER_GROUP}" --prefix --permission allow -y
rhoas kafka acl create --operation all --service-account ${KSQLCLIENT_ID} --topic "*" --permission allow -y
