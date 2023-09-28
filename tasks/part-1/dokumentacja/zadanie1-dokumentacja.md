# Dokumentacja do zadania-1

## Wstep

### Mapa sieci

SALT Master:
 - `IP: 193.187.69.1`
 - `hostname: server1`

SALT Minion:
 - `IP: 193.187.69.85`
 - `hostname: server2`


## Instalacja SALT

### Server1

`zypper install salt-master`

### Server2

`zypper install salt-minion`

## Konfiguracja SALT Master (server1)

Edycja glownego pliku konfiguracyjnego `/etc/salt/master`

 - `interface: 193.187.69.1`
 - `master_id: server1-master`
 - `ret_port: 4506`
 - `publish_port: 4505`

Edycja pliku `/etc/salt/roster` zawierajacego dane do logowania do minion

```
server2:
  host: 193.187.69.85
  user: root
  passwd: P0tyc2k!2k22
  minion_opts:
    master: 193.187.69.1
```

Uruchomienie salt-mastera:

`systemctl enable --now salt-master`

## Konfiguracja SALT Minion (server2)

Edycja pliku konfiguracyjnego `/etc/salt/minion`

 - `master: 193.187.69.1`
 - `id: server2`

Uruchomienie salt-minion

`systemctl enable --now salt-minion`

## Akceptacja klucza miniona na masterze

`salt-key -a server2`

Nalezy potiwerdzic akceptacje klucza enterem

## Tworzenie pliku `top.sls`

Zawartosc pliku `/srv/salt/top.sls`

```
base:
  'server2':
    - server2
```

Plik ten uruchamia akcje z pliku `/srv/salt/server2.sls` na minionie server2

## Tworzenie pliku `server2.sls`

Zawartosc pliku `/srv/salt/server2.sls`

```
apache2:
  pkg.installed

/srv/www/htdocs/index.html:
  file.managed:
    - source: salt://files/index.html
```

Plik ten wykonuje nastepujace czynnosci:
 - Instaluje pakiet `apache2`
 - zgrywa plik `salt://files/index.html` do miejsca na minionie (`/srv/www/htdocs/index.html`)

Dla rozjasnienia `salt://` to sciezka domowa salta czyli w tym wypadku `/srv/salt`

## Uruchomienie High State na masterze

High state wykonuje polecenia z pliku `top.sls` na wybranych w nim minionach.

Do weryfikacji High state:

`salt 'server2' state.show_top`

Aby wykonac High State:

`salt 'server2' state.apply`

## Efekt koncowy

Na adresie server2 (minion) pojawila sie strona www z zawartoscia pliku `index.html`


