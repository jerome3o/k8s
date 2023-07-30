# Nvidia k8s device plugin

This is to allow k8s pods to access GPUs

Followed [this guide](https://github.com/NVIDIA/k8s-device-plugin). There is a fair amount of setup needed for the gpu nodes.

It's also worth noting that the k3s docs held [the secret](https://docs.k3s.io/advanced#nvidia-container-runtime-support) for getting this working. A runtime class definition was needed.

## Setup

### Helm repo

```sh
helm repo add nvdp https://nvidia.github.io/k8s-device-plugin
helm repo update
```
### Label nodes

This should only be deployed on nodes with the correct Nvidia setup. Nvidia gpu nodes should be labelled like so:

```sh
kubectl label nodes {node_name} gpu=nvidia
```

In this case (at the time of writing):

```sh
kubectl label nodes mlrig gpu=nvidia
```

### Deploy

Then you will need to run the `deploy.sh` script in this directory.
