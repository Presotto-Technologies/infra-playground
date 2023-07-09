# Infra Playground

## Introduction
Made to run on minikube (not yet ready to run in cloud providers).
> The following stack will be deployed by terraform
1. Linkerd
2. Redis-Cluster
3. MongoDB-Shaded
4. MinIO/Garage
5. Grafana (+ prometheus)
6. OpenTelemetry
7. ArgoCD
8. Testkube
9. App

## Getting started
Make sure you have the following dependencies:
- [terraform](https://terraform.io)
- [minikube](https://minikube.sigs.k8s.io/docs/) (or any other k8)
> generate the `linkerd` certificates following the [readme](./terraform/modules/linkerd/certificates/README.md)
## Deployment
```
terraform init
terraform apply
```

## Port Forwarding
The web apps would be available by applying port forward to the services.
````
kubectl port-forward argo-cd-argocd-server 80:8080 -n ci-cd
kubectl port-forward web 80:8080 -n linkerd
````