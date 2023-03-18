#!/bin/bash

RANCHER_VERSION="2.7.1";

echo -n Please type in IP Address at which rancher will be accessed:\ ;
read rancher_ip;
echo RANCHER_IP: $rancher_ip;

echo Adding rancher repo to helm;
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
echo Repo added;

echo "Installing Rancher $RANCHER_VERSION at $rancher_ip using helm";
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.$rancher_ip.sslip.io --set replicas=1 --version "$RANCHER_VERSION" --create-namespace;
echo Rancher hopefully installed;
echo Now wait for rancher on https://rancher.$rancher_ip.sslip.io;
