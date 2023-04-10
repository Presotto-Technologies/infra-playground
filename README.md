# Infra Playground

## Introduction
Made to run on minikube (not yet ready to run in cloud providers).
> The following stack will be deployed by terraform
1. Linkerd
2. Redis-Cluster
3. MongoDB-Shaded
4. MinIO
5. Grafana (+ prometheus)
6. ArgoCD
7. Testkube
8. App

## Getting started
To deploy the stack is required `terraform` and `minikube` or any other kubernetes cluster.
## Deployment
```
terraform apply
```

## Port Forwarding
The web apps would be available by applying port forward to the services.
````
kubectl port-forward argo-cd-argocd-server 80:8080 -n ci-cd
kubectl port-forward web 80:8080 -n linkerd
````