module "service_account" {
  source = "../service_account_encrypted_on_gcs"

  project_id  = var.project
  bucket_name = var.service_account_bucket_name

  name          = "gcp-aws"
  project_roles = []
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    effect = "Allow"

    condition {
      test     = "StringEquals"
      variable = "accounts.google.com:aud"
      values   = [module.service_account.emil]
    }

    condition {
      test     = "StringEquals"
      variable = "accounts.google.com:oaud"
      values   = [module.service_account.emil]
    }

    principals {
      identifiers = ["accounts.google.com"]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "role_web_identity" {
  name               = var.aws_role_name
  description        = "Terraform-managed policy"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}
# terraform import aws_iam_role.role_web_identity "WebIdentity-Role"

data "aws_iam_policy_document" "web_identity_bucket_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "web_identity_bucket_policy" {
  name        = var.aws_policy_name
  path        = "/"
  description = "Terraform-managed policy"
  policy      = data.aws_iam_policy_document.web_identity_bucket_policy_document.json
}
# terraform import aws_iam_policy.web_identity_bucket_policy arn:aws:iam::240057002457:policy/WebIdentity-S3-Policy


resource "aws_iam_role_policy_attachment" "policy-attach" {
  role       = aws_iam_role.role_web_identity.name
  policy_arn = aws_iam_policy.web_identity_bucket_policy.arn
}
# terraform import aws_iam_role_policy_attachment.policy-attach WebIdentity-Role/arn:aws:iam::240057002457:policy/WebIdentity-S3-Policy
