# Dokumentacja do zadania X

## Wstep

Uzyte komendy
 - helm
 - kubectl

Uzylem takze moje skrypty z mojego repozytorium pod adresem:

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
 - kubectl
 - helm
 - cert-manager (z helm)

## Przebieg rozwiazania

### Instalacja rancher przy uzyciu helm

Plik `rancher-install.sh` z repozytorium:

```bash
RANCHER_VERSION="2.7.1";
RANCHER_IP="193.187.69.132"
REPLICAS=1

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.$RANCHER_IP.sslip.io --set replicas=$REPLICAS --version "$RANCHER_VERSION" --create-namespace;
```

Uruchomienie ranchera trwa kilka minut.

Po instalacji rancher bedzie dostepny pod adresem:

https://rancher.193.187.69.132.sslip.io

### Potwierdzenie rollout

Komenda:

`kubectl -n cattle-system rollout status deploy/rancher`

## Efekt koncowy

Dostepny jest panel rancher pod adresem:

https://rancher.193.187.69.132.sslip.io


