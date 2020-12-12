#!/bin/bash

###
### start the packer build process as a 
### GCE instance
### see also: https://www.packer.io/docs/builders/googlecompute.html#running-on-google-cloud
###


set -e      # bail on error

: {$GCP_PROJECT:Requires GCP_PROJECT}
: {$GCP_NETWORK:Requires GCP_NETWORK}
: {$GCP_ZONE:Requires GCP_ZONE}
: {$SERVICE_USER:Requires SERVICE_USER (name)}
: {$INSTANCE_NAME:Requires INSTANCE_NAME}

IMAGE_FAMILY=fedora-coreos-stable 
IMAGE_NAME=fedora-coreos-32-20201104-3-0-gcp-x86-64 

gcloud compute instances create $INSTANCE_NAME \
  --project $GCP_PROJECT \
  --image-family $IMAGE_FAMILY \
  --image-project $IMAGE_NAME \
  --network $GCP_NETWORK \
  --zone $GCP_ZONE \
  --service-account=$SERVICE_USER@$GCP_PROJECT.iam.gserviceaccount.com \
  --scopes="https://www.googleapis.com/auth/cloud-platform"
