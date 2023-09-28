# Dokumentacja do zadania X

## Wstep

W tym zadaniu do pokazania statusu komponentow komendy:
 - kubectl
 - helm

### Mapa sieci

 - server1 (rancher)
   - `IP: 193.187.69.132`
   - `Funkcja: server kubernetes`
 - server2 (cluster)
   - `IP: 193.187.69.178`
   - `Funkcja: klaster kubernetes`

## Potrzebne skladniki

 - kubernetes RKE2 (zadanie1)
 - kubectl
 - helm

## Przebieg rozwiazania

### Nody klastra

Komenda: `kubectl get nodes`

Przykladowe wyjscie:

```bash
NAME      STATUS   ROLES                       AGE   VERSION
server1   Ready    control-plane,etcd,master   42m   v1.22.17+rke2r1
```


# Pody klastra

Komenda: `kubectl get pods -A`

`A - all namespaces`

Przykladowe wyjscie:

```bash
NAMESPACE                   NAME                                                    READY   STATUS      RESTARTS      AGE
cattle-fleet-local-system   fleet-agent-58cc569b4d-2gn5m                            1/1     Running     0             46m
cattle-fleet-system         fleet-controller-659d44ddc5-7jrwn                       1/1     Running     0             48m
cattle-fleet-system         gitjob-7d9d998d8f-svf8v                                 1/1     Running     0             48m
cattle-system               helm-operation-54q7k                                    0/2     Completed   0             46m
cattle-system               helm-operation-6j5q9                                    0/2     Completed   0             47m
cattle-system               helm-operation-bbnkg                                    0/2     Completed   0             46m
cattle-system               helm-operation-ktn6g                                    0/2     Completed   0             48m
cattle-system               helm-operation-mt796                                    0/2     Completed   0             46m
cattle-system               helm-operation-t5plh                                    0/2     Completed   0             47m
cattle-system               rancher-6699c9578f-9dhnv                                1/1     Running     0             52m
cattle-system               rancher-webhook-5f46f4f7df-44jxl                        1/1     Running     0             47m
cert-manager                cert-manager-6d6bb4f487-pb7qt                           1/1     Running     0             56m
cert-manager                cert-manager-cainjector-7d55bf8f78-vkx7p                1/1     Running     0             56m
cert-manager                cert-manager-webhook-577f77586f-dm6g5                   1/1     Running     0             56m
kube-system                 cloud-controller-manager-server1                        1/1     Running     2 (49m ago)   57m
kube-system                 etcd-server1                                            1/1     Running     0             57m
kube-system                 helm-install-rke2-canal-4hjls                           0/1     Completed   0             58m
kube-system                 helm-install-rke2-coredns-pqwbg                         0/1     Completed   0             58m
kube-system                 helm-install-rke2-ingress-nginx-84wtc                   0/1     Completed   0             58m
kube-system                 helm-install-rke2-metrics-server-64llx                  0/1     Completed   0             58m
kube-system                 kube-apiserver-server1                                  1/1     Running     0             57m
kube-system                 kube-controller-manager-server1                         1/1     Running     2 (49m ago)   58m
kube-system                 kube-proxy-server1                                      1/1     Running     0             57m
kube-system                 kube-scheduler-server1                                  1/1     Running     2 (49m ago)   57m
kube-system                 rke2-canal-j4f5k                                        2/2     Running     0             57m
kube-system                 rke2-coredns-rke2-coredns-6775f768c8-798wm              1/1     Running     0             57m
kube-system                 rke2-coredns-rke2-coredns-autoscaler-7c77dcfb76-sdzz4   1/1     Running     0             57m
kube-system                 rke2-ingress-nginx-controller-8x2m6                     1/1     Running     0             55m
kube-system                 rke2-metrics-server-8574659c85-llmd8                    1/1     Running     0             56m
```

### Manager certyfikatow

Komenda: `helm list -n cert-manager`

Przykladowe wyjscie:

```bash
NAME        	NAMESPACE   	REVISION	UPDATED                                	STATUS  	CHART              	APP VERSION
cert-manager	cert-manager	1       	2023-03-21 10:46:56.835153126 +0100 CET	deployed	cert-manager-v1.7.1	v1.7.1
```

### Lista repozytoriow niezbednych do ranchera

Komenda: `helm dep list` bedac w repozytorium rancher

Wyjscie: `WARNING: no dependencies at charts`

