## How-to

### Development loop

1. Create local k8s cluster `my-kind-cluster` via KinD

    ```sh
    kind create cluster --name my-kind-cluster
    ```

2. Start skaffold to check for live changes in relevant code (/chart, /src, Dockerfile, ...)

    ```sh
    skaffold dev
    ```
    now every change wil cause a rebuilding and redeployment of docker image / helm chart (only if necessary)

### Build & Push final image + chart

```sh
# Set env variable to use as tag for IMAGE & CHART
export SEMVER="1.2.3"
# Build image & chart, push to GCP Artifact registry
skaffold build --push=true --cache-artifacts=false
```

### Cleanup

delete local k8s cluster to save on resource if you want to

```sh
kind delete cluster --name my-kind-cluster
```

