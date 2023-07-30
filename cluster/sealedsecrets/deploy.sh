helm upgrade --install \
    cluster-sealedsecrets \
    oci://registry-1.docker.io/bitnamicharts/sealed-secrets \
    -n cluster-sealedsecrets \
    --create-namespace
