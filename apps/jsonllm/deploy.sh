kubectl create namespace jsonllm
kubectl apply -n jsonllm \
    -f manifests/namespace.yaml \
    -f manifests/deployment.yaml \
    -f manifests/service.yaml \
    -f manifests/ingress.yaml \
    -f manifests/pv.yaml \
    -f manifests/pvc.yaml
