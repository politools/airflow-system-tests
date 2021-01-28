<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Creating temporary Google Cloud Projects for System Tests](#creating-temporary-google-cloud-projects-for-system-tests)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Creating temporary Google Cloud Projects for System Tests
=========================================================

```bash
SEED_PROJECT_ID=<root-seed-testing-project>
gcloud projects create ${SEED_PROJECT_ID}
gcloud config set project ${SEED_PROJECT_ID}

gcloud beta billing projects link ${SEED_PROJECT_ID}  --billing-account=<billing_account_id>

gcloud iam service-accounts create terraform --display-name "Terraform admin account"
gcloud iam service-accounts keys create  --iam-account terraform@${SEED_PROJECT_ID}.iam.gserviceaccount.com terraform.json
gcloud projects add-iam-policy-binding ${SEED_PROJECT_ID}  --member="serviceAccount:terraform@${SEED_PROJECT_ID}.iam.gserviceaccount.com"  --role="roles/editor"
gcloud projects add-iam-policy-binding ${SEED_PROJECT_ID}  --member="serviceAccount:terraform@${SEED_PROJECT_ID}.iam.gserviceaccount.com"  --role="roles/storage.admin"
gcloud projects add-iam-policy-binding ${SEED_PROJECT_ID}  --member="serviceAccount:terraform@${SEED_PROJECT_ID}.iam.gserviceaccount.com"  --role="roles/viewer"
gcloud projects add-iam-policy-binding ${SEED_PROJECT_ID}  --member="serviceAccount:terraform@${SEED_PROJECT_ID}.iam.gserviceaccount.com"  --role="roles/billing.projectManager"

gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
```

```bash
terraform init
terraform plan
```
