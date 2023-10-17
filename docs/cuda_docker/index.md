# Notes on containerising ML workloads with Docker

Make sure the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) is installed and configured on your system.

## Install (Ubuntu):

```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
  && \
    sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit
```

## Configuration

```sh
sudo nvidia-ctk runtime configure --nvidia-set-as-default --runtime=docker
sudo systemctl restart docker
```

Note that if you don't use the `--nvidia-set-as-default` option you will need to specify `--runtime=nvidia` when you call `docker run`.

## Test

I just test all the way to pytorch with (note I am using cuda 11.8 for something specific atm):

```sh
sudo docker run -it --rm pytorch/pytorch:2.1.0-cuda11.8-cudnn8-devel bash
```

Then run

```
python -c 'import torch; print(torch.cuda.is_available())'
```

It should print `True`

## Other notes

More things to be added here as I learn - for now I had issues with the `TORCH_CUDA_ARCH_LIST` variable while **building** images. No issues when running

See [this Dockerfile](https://github.com/jerome3o/gaussian-splatting/blob/main/Dockerfile) for an example regarding the TORCH_CUDA_ARCH_LIST.
