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
  - [Airflow Breeze Config](#airflow-breeze-config)
  - [Run Breeze in Google Cloud Build](#run-breeze-in-google-cloud-build)
  - [Run system tests on `apache/airflow` `master` branch](#run-system-tests-on-apacheairflow-master-branch)
  - [Docker image to run Breeze](#docker-image-to-run-breeze)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Airflow System Tests

Files that allows to run [Apache Airflow](https://github.com/apache/) system tests.
They are executed in **Google Cloud Build** by [Airflow Breeze](https://github.com/apache/airflow/blob/master/BREEZE.rst).

## Airflow Breeze Config

**WARNING**

Running tests is dependent on `airflow-breeze-config` project repository.

It should be available at `https://source.developers.google.com/p/"${PROJECT_ID}"/r/airflow-breeze-config` address.

If script `configure_gcb.sh` exists in the `airflow-breeze-config` repository will be executed.
It may be used to customize `init.sh` and install additional tools (e.g. `gcloud` command line tool).

This repository contains:

 - customized `init.sh` which sets all necessary environment variables
 - encrypted service accounts credentials which may be decrypted by executing `decrypt_all.sh` script.
   (see: [`github.com/apache/tests/providers/google/cloud/utils/gcp_authenticator.py`](https://github.com/apache/airflow/blob/6d6588fe2b8bb5fa33e930646d963df3e0530f23/tests/providers/google/cloud/utils/gcp_authenticator.py))

## Run Breeze in Google Cloud Build

Example of the command to run Google Memorystore system tests on the Airflow fork and non-default branch:

```shell
CMD="./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_cloud_memorystore_system.py -- -s --system=google"
AIRFLOW_REPO="https://github.com/PolideaInternal/airflow"
BRANCH="fix-to-issue-8286-cloud-memorystore-memcached-operators"

gcloud builds submit \
    --config=system_tests/cloudbuild.yaml \
    --timeout=3600 \
    --substitutions _CMD="${CMD}",_AIRFLOW_REPO="${AIRFLOW_REPO}",_BRANCH="${BRANCH}"
```

Setting `--timeout` for system tests is recommended.

### Substitutions

| Substitution        | Default value                                                                                                                              | Description                                                                                                    |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| `_CMD`              | `./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_natural_language_system.py -- -s --system=google` | Bash command run in `airflow-system-tests-env`.  See [Docker image to run Breeze](#docker-image-to-run-breeze) |
| `_AIRFLOW_REPO`     | `https://github.com/apache/airflow`                                                                                                        | URL of the Airflow git repository.                                                                             |
| `_BRANCH`           | `master`                                                                                                                                   | Name of the branch to checkout.                                                                                |
| `_TAG_TRIGGER_TYPE` | `trigger-manual`                                                                                                                           | Tag added do GCB build                                                                                         |
| `_TAG_TEST_NAME`    | `test-name-not-specified`                                                                                                                  | Tag added do GCB build                                                                                         |

## Run system tests on `apache/airflow` `master` branch

#### Run single test

```shell
bash scripts/run_single_system_test.sh tests/providers/google/cloud/operators/test_speech_to_text_system.py
```

#### Run multiple system tests whitelisted in `scripts/list_of_tests.sh`:

```shell
gcloud builds submit --config=cloudbuild_system_tests.yaml
```

Command to list all triggered builds will be in the last line of the log, e.g.:
```shell
List runs with command:

gcloud builds list --filter "tags='trigger-fdb3a03b-1f99-45fa-8dcb-5cf4d6ca3828'" --format="table[box,margin=3,title='system tests'](id,status,tags,logUrl)"
```

## Docker image to run Breeze

In `airflow_system_tests_env_image` folde is located `Dockerfile` which describes environment to run Breeze
(see [Breeze prerequisites](https://github.com/apache/airflow/blob/master/BREEZE.rst#prerequisites)).

To build image and push it to GCR:

```shell
cd airflow_system_tests_env_image
gcloud builds submit .
```

Docker image will be available at `gcr.io/$PROJECT_ID/airflow-system-tests-env:latest`.
