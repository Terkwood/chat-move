#!/bin/bash

### adapted from https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-gcp/

set -e

: {$GCP_ZONE:Requires GCP_ZONE}

STREAM='stable'
INSTANCE_NAME='chat-move-server'

# see https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-gcp/
IMAGE_PROJECT=fedora-coreos-cloud 
IMAGE_FAMILY=fedora-coreos-stable 

gcloud compute instances create $INSTANCE_NAME \
  --image-family $IMAGE_FAMILY \
  --image-project $IMAGE_PROJECT \
  --zone $GCP_ZONE \
  --machine-type f1-micro
