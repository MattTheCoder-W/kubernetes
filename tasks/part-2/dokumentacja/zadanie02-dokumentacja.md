# Dokumentacja do zadania X

## Wstep

W tym zadaniu zainstalowalem nastepujace elementy:
 - kubectl
 - helm
 - cert-manager (helm)
 - rancher (helm)

Do tego wykorzystalem moje wlasne skrypty z mojego repozytorium pod adresem:

https://github.com/MattTheCoder-W/kubernetes

### Mapa sieci

 - server1 (rancher)
   - `IP: 193.187.69.132`
   - `Funkcja: server kubernetes`
 - server2 (cluster)
   - `IP: 193.187.69.178`
   - `Funkcja: klaster kubernetes`

## Potrzebne skladniki

 - kubernetes RKE2 (zadanie1)

## Przebieg rozwiazania

### Instalacja kubectl

Plik `kubectl-install.sh` z repozytorium:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;

mkdir -p ~/.kube;
ln -s /etc/rancher/rke2/rke2.yaml ~/.kube/config;
```

### Instalacja helm

Plik `helm-install.sh` z repozytorium:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3;
chmod 700 get_helm.sh;
./get_helm.sh;
```

### Instalacja cert-manager przy uzyciu helm

Plik `cert-manager-install.sh` z repozytorium:

```bash
helm repo add jetstack https://charts.jetstack.io

CM_VERSION="v1.7.1"
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version "$CM_VERSION" --set installCRDs=true --create-namespace;

kubectl -n cert-manager rollout status deploy/cert-manager;
```

## Efekt koncowy

Zainstalowane sa narzedzia potrzebne do instalacji ranchera.

