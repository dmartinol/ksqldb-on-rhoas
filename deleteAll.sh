#!/bin/bash
source .env

rhoas kafka delete --name ${KAFKA_NAME} -y
CLIENT_ID=$(grep clientID ./${SA_CRED_JSON} | cut -d ":" -f2 | tr -d '", ')
rhoas service-account delete --id ${CLIENT_ID} -y

rm ./${SA_CRED_JSON}
rm ./${KAFKA_CONFIG_JSON}
