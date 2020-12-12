#!/bin/bash

###
### one time script to help create the necessary service user
### to operate the packer build process
###

set -e  # bail on error

# bail if not set
: ${GCP_PROJECT?Need a GCP project name}
: ${SERVICE_USER?Need a GCP service user name}

gcloud iam service-accounts create $SERVICE_USER --project $GCP_PROJECT --description "Packer Service Account"
gcloud projects add-iam-policy-binding $GCP_PROJECT --member=serviceAccount:$SERVICE_USER@$GCP_PROJECT.iam.gserviceaccount.com --role=roles/compoute.instanceAdmin.v1
gcloud projects add-iam-policy-binding $GCP_PROJECT --member=serviceAccount:$SERVICE_USER@$GCP_PROJECT.iam.gserviceaccount.com --role=roles/compoute.instanceAdmin.v2
gcloud projects add-iam-policy-binding $GCP_PROJECT --member=serviceAccount:$SERVICE_USER@$GCP_PROJECT.iam.gserviceaccount.com --role=roles/compute.instanceAdmin.v1
gcloud projects add-iam-policy-binding $GCP_PROJECT --member=serviceAccount:$SERVICE_USER@$GCP_PROJECT.iam.gserviceaccount.com --role=roles/iam.serviceAccountUser
