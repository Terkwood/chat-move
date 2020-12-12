# GCP administration

Right now it's just a [script](./launch.sh) to launch a Fedora CoreOS instance
on Google Compute Engine.

It requires a [firewall policy](https://console.cloud.google.com/networking/firewalls/list) to be created with the target tag "chat-move".

```sh
# e.g.
gcloud config set compute/region us-east1
gcloud config set compute/zone us-east1-a
sh launch.sh
```
