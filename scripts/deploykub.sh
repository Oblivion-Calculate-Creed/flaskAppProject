cd kubernetes/
kubectl apply -f namespace.yaml
kubectl apply -f secret.yaml
kubectl apply -f nginxconf.yaml
kubectl apply -f lb.yaml -f nginxdeploy.yaml -f frontenddeploy.yaml -f frontendcip.yaml -f backendcip.yaml -f backenddeploy.yaml
kubectl describe service lb -n flaskapp