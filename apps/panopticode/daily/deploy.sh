helm repo add oauth2-proxy https://oauth2-proxy.github.io/manifests

kubectl apply -f be/
kubectl apply -f fe/auth/manifests/
kubectl apply -f fe/manifests/

helm upgrade --install daily-auth oauth2-proxy/oauth2-proxy -n panopticode -f fe/auth/values.yaml
