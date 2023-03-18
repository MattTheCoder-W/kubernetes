#!/bin/bash

echo Downloading script from web;
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3;
echo Making script executable;
chmod 700 get_helm.sh;
echo Running downloaded script;
./get_helm.sh;
echo Helm hopefully installed;

