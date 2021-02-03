#!/usr/bin/env bash

# Auto-export all variables
set -a

source set_variables.sh

if [[ -f "variables_decrypted.env" ]]; then
   echo
   echo "Reading decrypted variables"
   echo
   source "variables_decrypted.env"
fi


echo
echo "Variables read"
echo
AIRFLOW__PROVIDERS_GOOGLE__VERBOSE_LOGGING="true"
set -m
set +a


echo
echo "Install gcloud"
echo

rm /usr/bin/gcloud || true
rm /opt/airflow/scripts/in_container/run_cli_tool.sh || true
bash <(curl https://sdk.cloud.google.com/) --disable-prompts
export PATH="/root/google-cloud-sdk/bin/:$PATH"
