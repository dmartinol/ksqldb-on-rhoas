#!/bin/bash
source ../.env

export KAFKA_HOST=$(grep kafkaHost ../${KAFKA_CONFIG_JSON} | cut -d ":" -f2 | tr -d '", ')
export RHOAS_SERVICE_ACCOUNT_CLIENT_ID=$(grep clientID ../${SA_CRED_JSON} | cut -d ":" -f2 | tr -d '", ')
export RHOAS_SERVICE_ACCOUNT_CLIENT_SECRET=$(grep clientSecret ../${SA_CRED_JSON} | cut -d ":" -f2 | tr -d '", ')
export RHOAS_SERVICE_ACCOUNT_OAUTH_TOKEN_URL=https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token

echo "Starting Quarkus receiver with"
echo "$KAFKA_HOST"
echo "$RHOAS_SERVICE_ACCOUNT_CLIENT_ID"
echo "$RHOAS_SERVICE_ACCOUNT_CLIENT_SECRET"
quarkus dev

