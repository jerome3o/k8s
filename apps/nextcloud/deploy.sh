helm repo add nextcloud https://nextcloud.github.io/helm/
helm repo update

helm install nextcloud nextcloud/nextcloud -n nextcloud --create-namespace
