# Airflow System Tests

Automated system tests of Airflow run in Google Cloud Build with Breeze.

### Run Breeze in Cloud Build

Setting `--timeout` is recommended.

| Substitution | default value |
|-|-|
| `_CMD` | `./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_natural_language_system.py -- -s --system=google` |
| `_AIRFLOW_REPO` | `https://github.com/apache/airflow` |
| `_BRANCH` | `master` |

Example:

```shell
cd system_tests

time gcloud builds submit . \
    --timeout=1800 \
    --substitutions _CMD='./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_gcs_system.py -- -s --system=google'

time gcloud builds submit . \
    --timeout=3600 \
    --substitutions _CMD='./breeze tests --verbose --backend=postgres tests/providers/google/cloud/operators/test_cloud_memorystore_system.py -- -s --system=google',_AIRFLOW_REPO='https://github.com/PolideaInternal/airflow',_BRANCH='fix-to-issue-8286-cloud-memorystore-memcached-operators'
```

### Cloud Builder

```shell
cd cloud_builder
gcloud builds submit .
```
