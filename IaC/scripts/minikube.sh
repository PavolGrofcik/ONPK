#!/bin/bash

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

### minikube: start
su - ubuntu -c "minikube start --nodes=1"
su - ubuntu -c "minikube addons enable ingress"
su - ubuntu -c "minikube status"