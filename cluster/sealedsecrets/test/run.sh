kubectl create namespace test-secret-unsealing

kubectl create secret generic test-secret \
    -n test-secret-unsealing \
    --from-literal=foo=bar \
    --dry-run=client \
    -o yaml > test-secret.yaml

kubeseal -f test-secret.yaml \
    --controller-namespace cluster-sealedsecrets \
    --controller-name cluster-sealedsecrets-sealed-secrets \
    -o yaml > test-secret-sealed.yaml

kubectl apply -f test-secret-sealed.yaml

kubectl get secret -n test-secret-unsealing test-secret  -o jsonpath='{.data.foo}' | base64 -d

kubectl delete namespace test-secret-unsealing
rm test-secret.yaml test-secret-sealed.yaml
