helm upgrade --install dagster dagster/dagster -n dagster -f values.yaml --create-namespace

kubectl apply \
    -f manifests/minio-dev-access-sealedsecret.yaml
