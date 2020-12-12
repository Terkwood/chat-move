#!/bin/bash

set -e

: {$IP_ADDRESS:Requires IP_ADDRESS}

gcloud compute addresses create chat-move --addresses $IP_ADDRESS
