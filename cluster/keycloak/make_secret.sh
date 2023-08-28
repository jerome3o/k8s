# Expects .env and .env.db files in current directory

# .env:
# KEYCLOAK_ADMIN=xxx
# KEYCLOAK_ADMIN_PASSWORD=xxx

# .env.db:
# postgres-password=xxx
# password=xxx
# username=xxx

# for keycloak-admin secret
kubectl create secret generic keycloak-admin \
    -n keycloak \
    --from-env-file .env \
    --dry-run=client \
    -o yaml > keycloak-admin.yaml

kubeseal -f keycloak-admin.yaml \
    --controller-namespace cluster-sealedsecrets \
    --controller-name cluster-sealedsecrets-sealed-secrets \
    -o yaml > manifests/keycloak-admin-sealedsecret.yaml

rm keycloak-admin.yaml

# db secret
seal keycloak-db keycloak .env.db
mv keycloak-db-sealedsecret.yaml manifests/db/keycloak-db-sealedsecret.yaml
