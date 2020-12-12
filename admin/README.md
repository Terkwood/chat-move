# GCP administration

To run packer scripts for GCE on your local machine,
you should log in using application default credentials.

```sh
gcloud auth application-default login
```

These scripts draw from instructions for [packer config](https://www.packer.io/docs/builders/googlecompute.html#running-on-google-cloud).
