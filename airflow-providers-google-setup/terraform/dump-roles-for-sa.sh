#!/usr/bin/env bash

gcloud projects get-iam-policy '${PROJECT_ID}' \
  '--flatten=bindings[].members' \
  '--format=value(bindings.role)' \
  '--filter=bindings.members:gcp-ai-account@polidea-airflow.iam.gserviceaccount.com'
