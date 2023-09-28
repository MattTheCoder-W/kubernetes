# Dokumentacja do zadania 5

## Wstęp

### Użyte narzędzia

Do monitorowania użyłem prostego narzędzia z repozytorium:

`https://github.com/dylanjamesdev/linux-dash-darkmode`

### Potrzebne składniki

 - `python`
   - `zypper install python`
 - `git`
   - `zypper install git`

## Przebieg wykonania zadania

### Instalacja serwisu do monitoringu

```
git clone --depth 1 https://github.com/afaqurk/linux-dash.git

cd linux-dash/app/server
```

### Uruchomienie serwera

Skrypt autostartu w `/etc/init.d/startMonitor.sh`

```bash
#!/bin/bash

echo [INFO] Starting server monitor
nohup python /root/linux-dash/app/server/index.py --port 9090 &

```

`chmod +x /etc/init.d/startMonitor.sh`

`/etc/init.d/startMonitor.sh`

## Efekt koncowy

Po przeprowadzeniu instalacji na kazdym z serwerów.

Dostepne sa 2 monitory pod adresami:
 - 193.187.69.1:9090
 - 193.187.69.85:9090