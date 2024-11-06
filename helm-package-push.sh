#!/bin/bash

# check env vars!
# https://skaffold.dev/docs/lifecycle-hooks/

echo SKAFFOLD_IMAGE_TAG=$SKAFFOLD_IMAGE_TAG

# Package the Helm chart
helm package chart --destination ./ --version $SKAFFOLD_IMAGE_TAG --app-version $SKAFFOLD_IMAGE_TAG

# Push the packaged chart to Artifact Registry using OCI support
helm push *.tgz oci://europe-west4-docker.pkg.dev/xx

# Clean up the packaged .tgz file to keep things tidy
rm *.tgz
