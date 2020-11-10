<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [System tests setup guide for Google services](#system-tests-setup-guide-for-google-services)
- [Before you begin](#before-you-begin)
- [Install steps](#install-steps)
- [Recreating service accounts](#recreating-service-accounts)
- [Project structure](#project-structure)
  - [Terraform modules](#terraform-modules)
  - [Environment](#environment)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

System tests setup guide for Google services
============================================

This guides describes how to configure Google Cloud to run systems tests. In particular, the necessary
service accounts are created, but not only that.

# Before you begin

1. You must have Google Cloud account with permissions to create new projects.
2. You must have AWS account with permissions to create new roles.
3. You must be logged into the CLI for both services - `aws` and `gcloud`.

# Install steps

It's suggested to create a new project to run systems tests, because some system tests require very high privileges.

1. Create a new project and gcloud configuration to host our service (optional, you can use an existing project and gcloud configuration.)

   ```bash
    export PROJECT_ID=<my-project-id>
    gcloud projects create "$PROJECT_ID"
    export CONFIG_ACCOUNT="$(gcloud config get-value account)"
    export CONFIG_ZONE="$(gcloud config get-value compute/zone)"
    export CONFIG_REGION="$(gcloud config get-value compute/region)"
    # create a new gcloud configuration for the project, not cessary if running in the cloud shell.
    gcloud config configurations create "$PROJECT_ID"
    gcloud config set account "$CONFIG_ACCOUNT"
    gcloud config set compute/zone "$CONFIG_ZONE"
    gcloud config set compute/region "$CONFIG_REGION"
    gcloud config set project "$PROJECT_ID"
    gcloud beta billing projects link "$PROJECT_ID" --billing-account=`gcloud beta billing accounts list --format='value(ACCOUNT_ID)' --limit 1`
    ```

1.  Copy one of your existing environments as a base for your environment. Subsequent commands will only
    be run in this environment, so you can change your working directory.

    ```bash
    CURRENT_ENV_NAME="$(ls terraform/envs/ | head -n 1)"
    ENV_NAME=<my-env-name>
    cp "terraform/envs/${CURRENT_ENV}" "terraform/envs/${ENV_NAME}"
    cd "terraform/envs/${ENV_NAME}"
    ```

1.  Update the project ID in the locals section

    ```tf
    locals {
      project_id = "<my-project-id>"
    }
    ```

1. (Optional) If you do not plan to use some service accounts, you can comment on this service account.

1. To create all resources in the environment, run:

    ```bash
    terraform apply
    ```
    After the operation is completed, you will see a summary with the number of created resources and
    the name of the bucket with the service accounts keys.

    ```
    Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

    Outputs:

    service_account_bucket_name = mik-laj-system-tests-system-tests-vosdwoos
    ```

1. Now you can verify the correct creation of the service account keys.

    ```baash
    SERVICE_ACCOUNT_BUCKET=service_account_bucket_name
    gsutil ls "gs://${SERVICE_ACCOUNT_BUCKET}/service-accounts/"
    ```

# Recreating service accounts

To delete all resources used by the service account and then create them again, you can use
the ``terraform taint`` command.  This command marks a resource as tainted, forcing a destroy and recreate
on the next plan/apply.

```
terraform taint module.campaign_manager_airflow
terraform apply
```

# Project structure

The goal of this structure is to keep terraform workspaces small and use and supporting test development
for many services at the same time. Individual services do not share resources, so all resources for a
one service can be deleted and restored without affecting others. The structure also supports independent
development by creating separate environments.

## Terraform modules

The resources for testing each service are in a separate module

 - `campaign_manager_airflow`
 - `dataflow_viewe_test`
 - `gcp-*` modules

There are also additional ones

 - `service_accounts_setup` - creates a bucket and KMS keys needed to securely store service account keys.
 - `service_account_entrypted_on_gcs` - creates a service account and stores the service account key on the GCS.

## Environment

There are two defined development environments:

- `mik-laj` - private development environment managed by Kamil Breguła.
- `polidea` -production-like environment where all service accounts are created. Some service accounts may
have granted special permission by third parties, so all service accounts cannot be deleted because some
system tests will stop working.
