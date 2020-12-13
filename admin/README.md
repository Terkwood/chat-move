# GCP administration

Various scripts to manage the server.

This configuration requires [firewall policies](https://console.cloud.google.com/networking/firewalls/list) for _both ingress and egress_ with the target tag `chat-move`.

You should also set a default region and zone before running any of this.

```sh
# e.g.
gcloud config set compute/region us-east1
gcloud config set compute/zone us-east1-a
sh launch.sh
```
