# Dokumentacja do zadania 4

## Wstep

### Mapa sieci

server1
 - `IP: 193.187.69.1'
 - 'Rola: server iSCSI'

server2
 - `IP: 193.187.69.85`
 - `Rola: klient iSCSI`

### Wykorzystane technologie

Wykorzystalem pakiet `yast2-iscsi-lio-server` z zyppera, ktory pozwala na "graficzna" konfiguracje server iSCSI za pomoca narzedzia `yast`.

### Dyski

Utworzyłem na dysku `/dev/vdb` partycje `/dev/vdb1` z systemem plików `ext4` (mkfs.ext4 /dev/vdb1)

## Przebieg wykonania

### Instalacja składników

 - yast2-iscsi-lio-server
   - `zypper install yast2-iscsi-lio-server`
   - `systemctl enable --now iscsi`

### Konfiguracja iscsi na server1

Konfiguracja graficzna:

`yast`

Zakladka: `Network Services -> iSCSI LIO Target`

Okno `Service`:
 - `After writing configuration: Restart`
 - `After reboot: Start`

Okno `Targets`:
 - `Add`
   - Wszystkie dane zostawione domyslnie
   - `Add`
     - `LUN Number: -1`
     - `LUN Path: /dev/vdb1`
     - `LUN Name: dev_vdb1`

Po zapisaniu serwer powinien byc gotowy.

### Konfiguracja klienta

#### Instalacja narzedzi:
 - `open-iscsi`
   - `zypper install open-iscsi`
   - `systemctl enable --now iscsi`

#### Znalezienie udostepnionego dysku:

`iscsiadm --mode discovery -t sendtargets --portal 193.187.69.1`

Przykladowy terget: `iqn.2023-03.com.example:63b35e2c3ed187d3359f`

#### Podłączenie się do dysku:

`iscsiadm --mode node --targetname iqn.2023-03.com.example:63b35e2c3ed187d3359f --portal 193.187.69.1 --login`

Dysk powinien zostać podłączony i być dostępny w `/dev/sdX`, w moim przypadku została mu przypisana nazwa `/dev/sda`.

Informacje na temat dysku można zobaczyć: `fdisk -l /dev/sda`. Jak widać nazwa dysku się zgadza (dev_vdb1).

#### Automatyczne montowanie dysku przy uzyciu `fstab`

Do pliku `/etc/fstab` dodano:

`/dev/sda /mnt ext4 _netdev,rw 0 0`

Aby przetestować działanie można wpisać: `mount -a` co zamontuje dysk iSCSI do `/mnt`.

## Efekt koncowy

W katalogu `/mnt` zamontowany jest dysk iSCSI z serwera 1.
