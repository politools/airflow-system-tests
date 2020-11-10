<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [`service_account_encrypted_on_gcs`](#service_account_encrypted_on_gcs)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# `service_account_encrypted_on_gcs`

creates a service account and stores the service account key on the GCS.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | The name of the bucket where the service account will be uploaded. | `string` | n/a | yes |
| name | The name of the service account. | `string` | n/a | yes |
| project\_id | Project id where the service account will be created. | `string` | n/a | yes |
| project\_roles | Roles to apply to service account, project=>role as elements. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| emil | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
