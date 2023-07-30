kubectl create namespace jsonllm
kubectl apply -n jsonllm \
    -f deployment.yaml \
    -f service.yaml \
    -f ingress.yaml \
    -f pv.yaml \
    -f pvc.yaml
