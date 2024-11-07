#!/bin/bash

# Check if Skaffold is configured to push images
if [ "$SKAFFOLD_PUSH_IMAGE" != "true" ]; then
  echo "Skipping Helm chart packaging and push since push is disabled."
  exit 0
fi

# # Debugging information
# echo "SKAFFOLD_IMAGE_TAG=$SKAFFOLD_IMAGE_TAG"
# echo "SKAFFOLD_PUSH_IMAGE=$SKAFFOLD_PUSH_IMAGE"

# Package the Helm chart with version and app-version based on image tag
helm package chart --destination ./ --version "$SKAFFOLD_IMAGE_TAG" --app-version "$SKAFFOLD_IMAGE_TAG"

# Push the packaged chart to Artifact Registry using OCI support
helm push *.tgz oci://europe-west4-docker.pkg.dev/shared-9456/sng-helm

# Clean up the packaged .tgz file to keep things tidy
rm *.tgz
