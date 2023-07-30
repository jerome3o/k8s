kubectl apply \
    -f manifests/configmap.yaml \
    -f manifests/ingress.yaml \
    -f manifests/nginx-deployment.yaml \
    -f manifests/service.yaml
