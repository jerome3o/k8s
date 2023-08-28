# Database:
kubectl apply -f manifests/db/

helm install keycloak-db oci://registry-1.docker.io/bitnamicharts/postgresql -n keycloak -f values-db.yaml

kubectl apply -f manifests/keycloak/
