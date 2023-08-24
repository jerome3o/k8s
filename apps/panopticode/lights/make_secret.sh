kubectl create secret generic bulb-ip \
    -n panopticode \
    --from-env-file .env \
    --dry-run=client \
    -o yaml > bulb-ip.yaml

kubeseal -f bulb-ip.yaml \
    --controller-namespace cluster-sealedsecrets \
    --controller-name cluster-sealedsecrets-sealed-secrets \
    -o yaml > manifests/bulb-ip-sealedsecret.yaml

rm bulb-ip.yaml
