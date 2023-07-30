kubectl apply \
    -f manifests/ingress.yaml \
    -f manifests/namespace.yaml \
    -f manifests/pod.yaml \
    -f manifests/pvc.yaml \
    -f manifests/pv.yaml \
    -f manifests/service.yaml
