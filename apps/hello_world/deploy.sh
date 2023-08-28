helm repo add oauth2-proxy https://oauth2-proxy.github.io/manifests

kubectl apply -f manifests/
kubectl apply -f auth/manifests/
helm upgrade --install oauth2-proxy-test oauth2-proxy/oauth2-proxy -f auth/values.yaml
