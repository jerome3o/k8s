helm repo add nextcloud https://nextcloud.github.io/helm/

kubectl apply -f manifests/

helm upgrade --install nextcloud nextcloud/nextcloud -n nextcloud --create-namespace -f values.yaml
