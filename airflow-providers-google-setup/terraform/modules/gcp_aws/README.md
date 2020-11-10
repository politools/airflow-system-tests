<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [`gcp_aws`](#gcp_aws)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# `gcp_aws`

The `gcp_aws` service account and all the resources it has access to.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_policy\_name | The name of the new AWS policy | `string` | `"WebIdentity-Policy-Airflow-System-Tests"` | no |
| aws\_role\_name | The name of the new AWS role. | `string` | `"WebIdentity-Role-Airflow-System-Tests"` | no |
| google\_openid\_audience | Constant value that is configured in the Airflow role and connection. It prevents misuse of the Google ID token. | `string` | `"aws-federation.airflow.apache.org"` | no |
| project | The Project ID where the service account will be created. | `string` | n/a | yes |
| service\_account\_bucket\_name | The name of bucket where the service account will be saved. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
