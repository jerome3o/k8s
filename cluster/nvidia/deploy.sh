kubectl apply -f runtime-class.yaml -n nvidia-device-plugin

helm upgrade -i nvdp nvdp/nvidia-device-plugin \
  --namespace nvidia-device-plugin \
  --create-namespace \
  --version 0.14.1 \
  -f values.yaml
