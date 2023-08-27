#!/bin/bash

# may be required: sudo docker login

# build
sudo docker build -t jerome3o/traefik-apikeys .

# publish
sudo docker push jerome3o/traefik-apikeys
