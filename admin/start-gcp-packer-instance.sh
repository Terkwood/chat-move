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
: {$SERVICE_USER:Requires SERVICE_USER name}
: {$INSTANCE_NAME:Requires INSTANCE_NAME}

# see https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-gcp/
IMAGE_PROJECT=fedora-coreos-cloud 
IMAGE_FAMILY=fedora-coreos-stable 

gcloud compute instances create $INSTANCE_NAME \
  --project $GCP_PROJECT \
  --image-family $IMAGE_FAMILY \
  --image-project $IMAGE_PROJECT \
  --network $GCP_NETWORK \
  --zone $GCP_ZONE \
  --service-account=$SERVICE_USER@$GCP_PROJECT.iam.gserviceaccount.com \
  --scopes="https://www.googleapis.com/auth/cloud-platform"
