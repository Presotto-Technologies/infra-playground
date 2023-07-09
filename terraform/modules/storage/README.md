### Setup garage
The following commands are required to setup replication between zones and to setup the buckets and credentials to access it. Change the values accordingly.

```
// apply storage layout
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage status
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage layout assign -z a-0 -c 1 d6eafb7f415836e7
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage layout apply --version 1

// setup buckets
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage bucket create testkube-artifacts 
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage bucket create testkube-logs
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage bucket create temp

// setup credentials
garage key new --name development
kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage bucket allow \
  --read \
  --write \
  --owner \
  testkube-artifacts \
  --key development

kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage bucket allow \
  --read \
  --write \
  --owner \
  testkube-logs \
  --key development

  kubectl exec -c garage --stdin --tty -n storage garage-0 -- ./garage bucket allow \
  --read \
  --write \
  --owner \
  temp \
  --key development
```

Add ingress?