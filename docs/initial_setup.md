# Initial considerations

Looked into microk8s and k3s (and some of the dev ones like minikube, kubeadm, kind) and decided on [k3s](https://k3s.io/) as I've worked in some rancher clusters before, and the setup seemed really easy.

# Steps taken to set up the cluster

## On control plane (flatserver)

```sh
curl -sfL https://get.k3s.io | sh -
```

## On the workers

```sh
curl -sfL https://get.k3s.io | K3S_URL=https://${tailscale_ip_of_flatserver}:6443 K3S_TOKEN=${node_token} sh -
```

Where `node_token` was located on the server at `/var/lib/rancher/k3s/server/node-token`

### GPU Nodes

Following [this](https://github.com/NVIDIA/k8s-device-plugin#quick-start).

Add this to `/etc/containerd/config.toml`

```toml
version = 2
[plugins]
  [plugins."io.containerd.grpc.v1.cri"]
    [plugins."io.containerd.grpc.v1.cri".containerd]
      default_runtime_name = "nvidia"

      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia]
          privileged_without_host_devices = false
          runtime_engine = ""
          runtime_root = ""
          runtime_type = "io.containerd.runc.v2"
          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia.options]
            BinaryName = "/usr/bin/nvidia-container-runtime"
```

## On the dev pc

### Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

```sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# make sure this is ok
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# then install
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Copy `/etc/rancher/k3s/k3s.yaml` to `~/.kube/config` on the dev machine. I also needed to edit it slightly so that it didn't use the loopback address.

### Install [helm](https://helm.sh/docs/intro/install/)

```sh
wget https://get.helm.sh/helm-v3.12.2-linux-amd64.tar.gz
tar -zxvf helm-v3.12.2-linux-amd64.tar.gz
rm helm-v3.12.2-linux-amd64.tar.gz
mv linux-amd64/helm ~/.local/bin/
rm -rf linux-amd64
```

### Install [k9s](https://k9scli.io/topics/install/) (Optional)

```sh
wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
mkdir k9s_Linux_amd64
tar -zxvf k9s_Linux_amd64.tar.gz -C k9s_Linux_amd64
chmod +x k9s_Linux_amd64/k9s
mkdir ~/.local/bin/
mv k9s_Linux_amd64/k9s ~/.local/bin/

rm k9s_Linux_amd64.tar.gz
rm -rf k9s_Linux_amd64/
```

### Install [kubeseal](https://github.com/bitnami-labs/sealed-secrets#linux)

```sh
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.23.0/kubeseal-0.23.0-linux-amd64.tar.gz
tar -xvzf kubeseal-0.23.0-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
rm kubeseal kubeseal-0.23.0-linux-amd64.tar.gz
```
