kubectl apply \
  -f manifests/namespace.yaml \
  -f manifests/runtime-class.yaml

helm upgrade -i nvdp nvdp/nvidia-device-plugin \
  --namespace nvidia-device-plugin \
  --create-namespace \
  --version 0.14.1 \
  -f values.yaml
