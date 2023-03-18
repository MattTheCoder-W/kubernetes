#!/bin/bash

echo Downloading install script from web;
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";
echo Script downloaded

echo Installing kubectl using apt;
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;
echo kubectl hopefully installed;

echo Creating local kubectl config dir;
mkdir -p ~/.kube;
echo Soft linking rke2 config to kube config;
ln -s /etc/rancher/rke2/rke2.yaml ~/.kube/config;

echo [NOTE] If you have any problem about permissions associated with .kube/config file run:;
echo sudo chown \$USER -R /etc/rancher/rke2/rke2.yaml;
echo Thats all!;
