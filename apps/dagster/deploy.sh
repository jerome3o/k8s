helm repo add oauth2-proxy https://oauth2-proxy.github.io/manifests
helm repo add dagster https://dagster-io.github.io/helm

helm upgrade --install dagster dagster/dagster -n dagster -f dagster/values.yaml --create-namespace
kubectl apply -f dagster/manifests/

helm upgrade --install dagster-auth oauth2-proxy/oauth2-proxy -n dagster -f auth/values.yaml
kubectl apply -f auth/manifests/
