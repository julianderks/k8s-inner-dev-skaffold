Prerequisites
Make sure you have the following tools installed:

Docker - For containerizing the microservice.
Kind - To create a local Kubernetes cluster.
Helm - For packaging Kubernetes manifests.
Skaffold - For streamlining the development workflow.
Python - For the microservice development.

Kubernetes VSCODE:

kind create cluster --name

kind delete cluster --name my-cluster
kind create cluster --name my-cluster

skaffold dev
skaffold render
skaffold build --push=true

export SEMVER="1.2.3"
skaffold build --push=true --cache-artifacts=false
