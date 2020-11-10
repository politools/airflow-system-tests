<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [`service_accounts_setup`](#service_accounts_setup)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# `service_accounts_setup`

IaC module to creates a bucket and KMS keys needed to securely store service account keys.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project | The Project ID where the service account will be created. | `string` | n/a | yes |
| service\_account\_bucket\_name | The name of bucket where the service account will be saved. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_name | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
