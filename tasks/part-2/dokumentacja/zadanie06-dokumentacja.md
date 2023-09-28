# Dokumentacja do zadania 6

## Wstep

Tworzenie kontenera `nginx` w namespace `nginx` za pomoca deployment.

Udostepnianie kontenera za pomoca ingresu pod adresem: nginx.193.187.69.178.sslip.io:80

## Przebieg wykonania zadania

### Tworzenie namespace

Na cele finalu utowrzylem projekt `potyczki`

`Cluster -> Projects/Namespaces -> Create Project`

 - `Name: potyczki`

`Cluster -> Projects/Namespaces -> potyczki -> Create Namespace`

 - `Name: nginx`

### Tworzenie deployment

`Workload -> Deployments -> Create`

 - `Namespace: nginx`
 - `Name: nginx-server`
 - `Replicas: 1`
 - `Container Name: nginx-0`
 - `Container Image: nginx`
 - `Ports`
   - `Service Type: Node Port`
   - `Name: http`
   - `Private Container Port: 80`
 
 Screen konfiguracji:
 
 ![image](https://user-images.githubusercontent.com/128246734/226599564-b8839831-1c4f-4692-aec3-e3702b3418b9.png)

### Tworzenie Ingress

`Service Discovery -> Ingresses -> Create`
 - `Name: nginx-ingress`
 - `Namespace: nginx`
 - `Request Host: nginx.193.187.69.178.sslip.io`
 - `Prefix: /`
 - `Target Service: nginx-server-nodeport`
 - `Port: 80`

Screen konfiguracji:

![image](https://user-images.githubusercontent.com/128246734/226600074-c1aacb1f-f9ff-409d-9a06-37a6d5af53c1.png)

## Efekt koncowy

Strona dostepna pod adresem: http://nginx.193.187.69.178.sslip.io/

![image](https://user-images.githubusercontent.com/128246734/226600245-f0cd7b40-7f5d-43e6-9b20-a70c44ba14e9.png)

