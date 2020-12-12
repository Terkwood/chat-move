#!/bin/bash

### adapted from https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-gcp/

set -e

STREAM='stable'
VM_NAME='fcos-node01'
gcloud compute instances create --image-project "fedora-coreos-cloud" --image-family "fedora-coreos-${STREAM}" "${VM_NAME}"
