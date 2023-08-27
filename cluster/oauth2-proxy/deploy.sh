helm repo add oauth2-proxy https://oauth2-proxy.github.io/manifests

k apply -f oauth-testclient-sealedsecret.yaml
helm install oauth2-proxy-test oauth2-proxy/oauth2-proxy -f values.yaml
# upgrade with:
# helm upgrade oauth2-proxy-test oauth2-proxy/oauth2-proxy -f values.yaml
