# Dokumentacja do zadania 1

## Wstep

Wykorzystalem wersje kubernetesa 1.22 z klasterem typu RKE2.

### Mapa sieci

 - server1 (rancher)
   - `IP: 193.187.69.132`
   - `Funkcja: server kubernetes`
 - server2 (cluster)
   - `IP: 193.187.69.178`
   - `Funkcja: klaster kubernetes`

## Potrzebne skladniki

 - Podstawowe narzedzia GNU 

## Przebieg rozwiazania


### Instalacja kubernetes

```bash
curl -sfL https://get.rke2.io | INSTALL_RKE2_CHANNEL="v1.22" sh -l
mkdir -p /etc/rancher/rke2
echo "write-kubeconfig-mode: 0644\n" > /etc/rancher/rke2/config.yaml
systemctl enable --now rke2-server
```

## Efekt koncowy

Na serwerze zainstalowana jest wersja 1.22 kubernetesa z klasterem typu RKE2.


