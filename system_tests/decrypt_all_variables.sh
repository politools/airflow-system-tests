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
set -euo pipefail

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KEYRING=${KEYRING:-airflow}
KEY=${KEY:-airflow_crypto_key}

function _decrypt_variables () {
  echo
  echo "Decrypting variables"
  echo
  printenv | cut -d "=" -f 1 | grep -e "ENCRYPTED$" | while read -r key; do
      val=${!key}
      decrypted_key=${key%_ENCRYPTED}
      decrypted_val=$( (base64 --decode | gcloud kms decrypt --plaintext-file=-\
           --ciphertext-file=- \
           --location=global \
           --keyring="${KEYRING}" \
           --key="${KEY}") <<< "$val")
      echo "export ${decrypted_key}=${decrypted_val}"
  done
}

. "${MY_DIR}/set_variables.sh" >/dev/null

_decrypt_variables > "${MY_DIR}/variables_decrypted.env" || echo "decrypting variables failed"
