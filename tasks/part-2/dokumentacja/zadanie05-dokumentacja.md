# Dokumentacja do zadania X

## Wstep

Tworzenie klastra za pomoca panelu ranchera.

W dokumentacji pominalem proces ustawiania hasla w rancher.

### Mapa sieci

 - server1 (rancher)
   - `IP: 193.187.69.132`
   - `Funkcja: server kubernetes`
 - server2 (cluster)
   - `IP: 193.187.69.178`
   - `Funkcja: klaster kubernetes`

## Potrzebne skladniki

 - kubernetes
 - helm
 - kubectl
 - cert-manager
 - rancher

## Przebieg rozwiazania

### Tworzenie klastra

W zakladce Clusters.

-> Create

Cluster Type: RKE2/K3s

-> Custom

Cluster Name: produkcyjny

Kubernetes Version: v1.23.16

-> Create

Step 1: Show Advanced

Node Name: cluster-team5
Node Public IP: 193.187.69.178

Step 2: Insecure (check)

Wywolywanie komendy na cluster-team5 server

```bash
curl --insecure -fL https://rancher.193.187.69.132.sslip.io/system-agent-install.sh | sudo  sh -s - --server https://rancher.193.187.69.132.sslip.io --label 'cattle.io/os=linux' --token t8tr62hvvm4ssdl6vvrvssndbl4q2kk7zz7ncg55qmm42gbb7r8nlx --ca-checksum 8588aa309d62ff1e14a271955dc3866e651a09ee37cc9a5eeafb7e15d35863f2 --etcd --controlplane --worker --address 193.187.69.178 --node-name cluster-team5
```

## Efekt koncowy

Dostepny jest nowy klaster o nazwie `produkcyjny`.

