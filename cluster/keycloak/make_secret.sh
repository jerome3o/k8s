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
