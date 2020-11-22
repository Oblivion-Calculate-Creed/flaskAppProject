cd kubernetesProject/
sudo kubectl apply -f namespace.yaml
sudo kubectl apply -f secret.yaml
sudo kubectl apply -f nginxconf.yaml
sudo kubectl apply -f lb.yaml -f nginxdeploy.yaml -f frontenddeploy.yaml -f frontendcip.yaml -f backendcip.yaml -f backenddeploy.yaml
sudo kubectl describe service lb -n flaskapp