#!/usr/bin/env bash

terraform import 'module.firebase-adminsdk-tmvtr_sa.google_service_account.service_accounts[0]' projects/polidea-airflow-firestore/serviceAccounts/firebase-adminsdk-tmvtr@polidea-airflow-firestore.iam.gserviceaccount.com
terraform import 'module.campaign-manager-airflow_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/campaign-manager-airflow@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.dataflow-viewer-test_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/dataflow-viewer-test@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-ai-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-ai-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-automl-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-automl-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-bigquery-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-bigquery-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-bigtable-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-bigtable-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-cloud-build-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-cloud-build-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-cloudsql-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-cloudsql-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-compute-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-compute-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-dataproc-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-dataproc-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-datastore-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-datastore-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-dlp_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-dlp@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-function-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-function-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-gke-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-gke-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-memorystore_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-memorystore@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-pubsub-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-pubsub-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-secret-manager-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-secret-manager-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-spanner-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-spanner-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-storage-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-storage-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-storage-transfer-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-storage-transfer-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-task-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-task-account@polidea-airflow.iam.gserviceaccount.com
terraform import 'module.gcp-vision-account_sa.google_service_account.service_accounts[0]' projects/polidea-airflow/serviceAccounts/gcp-vision-account@polidea-airflow.iam.gserviceaccount.com

terraform import 'module.firebase-adminsdk-tmvtr_sa.google_project_iam_member.project-roles[0]' "polidea-airflow-firebase roles/bigquery.admin serviceAccount:firebase-adminsdk-tmvtr@polidea-airflow-firebase.iam.gserviceaccount.com"
terraform import 'module.firebase-adminsdk-tmvtr_sa.google_project_iam_member.project-roles[0]' "polidea-airflow-firebase roles/compute.networkAdmin serviceAccount:firebase-adminsdk-tmvtr@polidea-airflow-firebase.iam.gserviceaccount.com"
terraform import 'module.campaign-manager-airflow_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/storage.objectCreator serviceAccount:campaign-manager-airflow@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.campaign-manager-airflow_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/storage.objectViewer serviceAccount:campaign-manager-airflow@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.campaign-manager-airflow_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/storagetransfer.admin serviceAccount:campaign-manager-airflow@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.campaign-manager-airflow_sa.google_project_iam_member.project-roles[3]' "polidea-airflow roles/storagetransfer.user serviceAccount:campaign-manager-airflow@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.dataflow-viewer-test_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/bigquery.admin serviceAccount:dataflow-viewer-test@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.dataflow-viewer-test_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/dataflow.admin serviceAccount:dataflow-viewer-test@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-ai-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/automl.admin serviceAccount:gcp-ai-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-ai-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/dataflow.admin serviceAccount:gcp-ai-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-ai-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/ml.admin serviceAccount:gcp-ai-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-automl-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/automl.admin serviceAccount:gcp-automl-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-automl-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/automl.editor serviceAccount:gcp-automl-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-automl-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/serviceusage.serviceUsageAdmin serviceAccount:gcp-automl-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-bigquery-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/bigquery.admin serviceAccount:gcp-bigquery-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-bigquery-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/bigquerydatatransfer.serviceAgent serviceAccount:gcp-bigquery-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-bigquery-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/storage.objectAdmin serviceAccount:gcp-bigquery-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-bigtable-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/bigtable.admin serviceAccount:gcp-bigtable-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-bigtable-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/dataproc.editor serviceAccount:gcp-bigtable-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-cloud-build-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/cloudbuild.builds.editor serviceAccount:gcp-cloud-build-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-cloud-build-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/source.admin serviceAccount:gcp-cloud-build-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-cloud-build-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/storage.admin serviceAccount:gcp-cloud-build-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-cloud-build-account_sa.google_project_iam_member.project-roles[3]' "polidea-airflow roles/storage.objectAdmin serviceAccount:gcp-cloud-build-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-cloudsql-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/cloudsql.admin serviceAccount:gcp-cloudsql-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-compute-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/compute.instanceAdmin serviceAccount:gcp-compute-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-compute-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/compute.instanceAdmin.v1 serviceAccount:gcp-compute-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-compute-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/iam.serviceAccountUser serviceAccount:gcp-compute-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-datastore-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/owner serviceAccount:gcp-datastore-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-dlp_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/dlp.admin serviceAccount:gcp-dlp@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-function-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/cloudfunctions.developer serviceAccount:gcp-function-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-function-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/source.reader serviceAccount:gcp-function-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-gke-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/container.admin serviceAccount:gcp-gke-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-gke-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/container.clusterAdmin serviceAccount:gcp-gke-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-gke-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/iam.serviceAccountUser serviceAccount:gcp-gke-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-memorystore_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/memcache.admin serviceAccount:gcp-memorystore@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-memorystore_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/redis.admin serviceAccount:gcp-memorystore@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-memorystore_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/storage.admin serviceAccount:gcp-memorystore@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-memorystore_sa.google_project_iam_member.project-roles[3]' "polidea-airflow roles/storage.hmacKeyAdmin serviceAccount:gcp-memorystore@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-pubsub-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/owner serviceAccount:gcp-pubsub-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-pubsub-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/pubsub.admin serviceAccount:gcp-pubsub-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-secret-manager-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/secretmanager.admin serviceAccount:gcp-secret-manager-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-spanner-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/spanner.admin serviceAccount:gcp-spanner-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-storage-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/storage.admin serviceAccount:gcp-storage-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-storage-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/storage.objectAdmin serviceAccount:gcp-storage-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-storage-account_sa.google_project_iam_member.project-roles[2]' "polidea-airflow roles/storage.objectViewer serviceAccount:gcp-storage-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-storage-transfer-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/editor serviceAccount:gcp-storage-transfer-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-task-account_sa.google_project_iam_member.project-roles[0]' "polidea-airflow roles/appengine.appViewer serviceAccount:gcp-task-account@polidea-airflow.iam.gserviceaccount.com"
terraform import 'module.gcp-task-account_sa.google_project_iam_member.project-roles[1]' "polidea-airflow roles/cloudtasks.admin serviceAccount:gcp-task-account@polidea-airflow.iam.gserviceaccount.com"
