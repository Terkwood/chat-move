#!/bin/bash

### adapted from https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-gcp/
### requires a firewall policy to be created with the target tag "chat-move"


set -e

INSTANCE_NAME='chat-move-server'

IMAGE_PROJECT=debian-cloud 
IMAGE_FAMILY=debian-10

gcloud compute instances create $INSTANCE_NAME \
  --image-family $IMAGE_FAMILY \
  --image-project $IMAGE_PROJECT \
  --machine-type f1-micro \
  --tags chat-move # CAUTION: the firewall policies for egress and ingress need to be tagged with "chat-move"
