# Dokumentacja do zadania 9

## Wstep

Instalacja WordPress z sotrage persystentnym 3GB.

StorageClass to longhorn (default).

## Przebieg zadania

### Instalacja WordPress

`Apps -> Charts -> wordpress (z repozytorium z zadania 8)`
 - `Name: wordpress`
 - `Namespace: default`
 - `Wordpress Persistent Volume Enabled`
   - `Volume Size: 3Gi`
 - `Database Settings`
   - `Persistent Volume Enabled: yes`
   - `Volume Size: 3Gi`

Wordpress konfiguracja:

![image](https://user-images.githubusercontent.com/128246734/226626862-9506426a-4d2a-454d-ac88-e06799c690ba.png)

![image](https://user-images.githubusercontent.com/128246734/226734683-e17e2c7b-2f20-44c0-9ee6-992026f3a951.png)

## Efekt koncowy

![image](https://user-images.githubusercontent.com/128246734/226736414-438abbcb-f00b-4126-9694-32b85aaee133.png)
