#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# Auto-export all variables
set -a

echo
echo "Starting init.sh"
echo

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
