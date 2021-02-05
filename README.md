<!--
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
-->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Airflow System Tests](#airflow-system-tests)
  - [Setting up environment](#setting-up-environment)
  - [Running tests](#running-tests)
  - [Google Cloud Build configuration to run Breeze](#google-cloud-build-configuration-to-run-breeze)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Airflow System Tests

Files that allows to run [Apache Airflow](https://github.com/apache/) system tests.
They are executed in **Google Cloud Build** by [Airflow Breeze](https://github.com/apache/airflow/blob/master/BREEZE.rst).

## Setting up environment

  ### 1. Preparing Google Cloud Project

  Instruction how create Google Cloud Project for system tests is available in `airflow-providers-google-setup` folder.
  See instructions: [airflow-providers-google-setup/README.md](airflow-providers-google-setup/README.md)

  ### 2. Modify files

  Modify following files:
   - `system_tests/cloudbuild.yaml` - so `_SERVICE_ACCOUNTS_GCS_BUCKET` will point to bucket with service accounts.
      It is created in the previous step (output of `terraform apply` command prints bucket name `service_account_bucket_name`).
   - `system_tests/cloudbuild.yaml` - so `LOGS_GCS_BUCKET` will point to bucket where Cloud Build logs will be uploaded.
      It is created in the previous step (output of `terraform apply` command prints bucket name `cloud_build_logs_bucket_name`).
   - `scripts/list_of_tests.sh` - comment / uncomment out tests which are / are not intended to run.

  ### 3. Build docker image to run Breeze

  In `airflow_system_tests_env_image` folder is located `Dockerfile` which describes environment to run Breeze
  (see [Breeze prerequisites](https://github.com/apache/airflow/blob/master/BREEZE.rst#prerequisites)).

  To build image and push it to GCR:

  ```shell
  cd airflow_system_tests_env_image
  gcloud builds submit .
  ```

  Docker image will be available at `gcr.io/$PROJECT_ID/airflow-system-tests-env:latest`.

## Running tests

  ### Run multiple system tests whitelisted in `scripts/list_of_tests.sh`

  They will be executed by default on `apache/airflow` repository on `master` branch

  ```shell
  gcloud builds submit --config=cloudbuild_system_tests.yaml
  ```

  Command to list all triggered builds will be in the last line of the log, e.g.:
  ```shell
  List runs with command:

  gcloud builds list --filter "tags='trigger-fdb3a03b-1f99-45fa-8dcb-5cf4d6ca3828'" --format="table[box,margin=3,title='system tests'](id,status,tags,logUrl)"
  ```

  ### Run single system test

  It will be executed by default on `apache/airflow` repository on `master` branch.

  ```shell
  bash scripts/run_single_system_test.sh tests/providers/google/cloud/operators/test_speech_to_text_system.py
  ```

  ### Run any command in Breeze environment

  Example of the command to run Google Memorystore system tests on the Airflow fork and non-default branch.

  ```shell
  CMD="./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_cloud_memorystore_system.py -- -s --system=google"
  AIRFLOW_REPO="https://github.com/PolideaInternal/airflow"
  BRANCH="fix-to-issue-8286-cloud-memorystore-memcached-operators"

  cd system_tests
  gcloud builds submit \
      --timeout=3600 \
      --substitutions _CMD="${CMD}",_AIRFLOW_REPO="${AIRFLOW_REPO}",_BRANCH="${BRANCH}"
  ```

  Setting `--timeout` for system tests is recommended.

## Google Cloud Build configuration to run Breeze

Configuration is located in `system_tests` folder. It supports following substitutions:

| Substitution                   | Default value                                                                                                                              | Description                                                                                                                                                                                                                                           |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `_CMD`                         | `./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_natural_language_system.py -- -s --system=google` | Bash command run in `airflow-system-tests-env`.  See [Docker image to run Breeze](#docker-image-to-run-breeze)                                                                                                                                        |
| `_AIRFLOW_REPO`                | `https://github.com/apache/airflow`                                                                                                        | URL of the Airflow git repository.                                                                                                                                                                                                                    |
| `_BRANCH`                      | `master`                                                                                                                                   | Name of the branch to checkout.                                                                                                                                                                                                                       |
| `_TAG_TRIGGER_TYPE`            | `trigger-manual`                                                                                                                           | Tag added do GCB build                                                                                                                                                                                                                                |
| `_TAG_TEST_NAME`               | `test-name-not-specified`                                                                                                                  | Tag added do GCB build                                                                                                                                                                                                                                |
| `_LOGS_GCS_BUCKET`             | `airflow-system-tests-logs`                                                                                                                | GCS bucket where tests logs are uploaded                                                                                                                                                                                                              |
| `_SERVICE_ACCOUNTS_GCS_BUCKET` | `airflow-systest-project-system-tests-rlugtuhw`                                                                                           | GCS bucket where service accounts keys are stored (it is output from `airflow-providers-google-setup/terraform/modules/service_accounts_setup/outputs.tf`, see: [airflow-providers-google-setup/README.md](airflow-providers-google-setup/README.md)) |
