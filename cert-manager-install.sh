#!/bin/bash

echo Adding cert-manager repo to helm;
helm repo add jetstack https://charts.jetstack.io

CM_VERSION="v1.7.1"
echo "Installing cert-manager $CM_VERSION using helm";
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version "$CM_VERSION" --set installCRDs=true --create-namespace;

echo Cert Manager hopefully installed;
echo Testing cert-manager rollout;

kubectl -n cert-manager rollout status deploy/cert-manager;

echo "Check line above for success verification";
