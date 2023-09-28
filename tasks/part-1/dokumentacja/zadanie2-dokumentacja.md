# Dokumentacja do zadania 2

## Wstep

Do udostepnienia repozytorium uzylem NFS.

### Mapa sieci

server1:
 - `IP: 193.187.69.1`
 - `repozytorium: /srv/www/htdocs/local-nano`

server2:
 - `IP: 193.187.69.85`
 - Jest klientem

## Instalacja potrzebnych skladnikow na server1

Potrzebne skladniki:
 - serwer NFS
   - `zypper install nfs-kernel-server`
 - gpg (domyslnie dostepne)
 - inst-source-utils (do tworzenia struktury repozytorium)
   - `zypper install inst-source-utils`

## Proces wykonywania zadania

### Tworzenie klucza GPG

`gpg --gen-key`

Nalezy zapisac sobie haslo do klucza (tutaj) w pliku `/tmp/password`.

Do pozniejszego podpisywania repozytorium bedzie potrzebna krotka forma wlasciciela klucza:

`gpg --keyid-format short --list-keys`

Przykladowe wyjscie:

```
pub   rsa3072/C80005E9 2023-03-20 [SC] [expires: 2025-03-19]
      75E885C186EEC4475F74C8A55184BF00C80005E9
```

Gdzie `C80005E9` to potrzebna wartosc. Bedzie sie ona pojawiac w kolejnych krokach.

### Tworzenie repozytorium

Tworzenie katalogu glownego

```
mkdir /srv/www/htdocs/local-nano && cs /srv/www/htdocs/local-nano
```

Tworzenie struktury plikow (oraz pobranie pliku .rpm)

```
create_update_source.sh .
cd updates
mkdir -p suse/x86_64
cd suse/x86_64
wget http://rpmfind.net/linux/opensuse/distribution/leap/15.4/repo/oss/x86_64/nano-5.9-bp154.1.53.x86_64.rpm
```

Tworzenie sum MD5 plikow .rpm

```
/srv/www/htdocs/local-nano/updates/suse/$> create_md5sums ./
```

Tworzenie plikow dot. metadanych repozytorium

```
/srv/www/htdocs/local-nano/updates/suse/$> create_package_descr -x setup/descr/EXTRA_PROV -C
```

Tworzenie sum MD5 metadanych repozytorium

```
/srv/www/htdocs/local-nano/updates/suse/$> create_md5sums ./ 
```

Zapisanie nowych plikow do `directory.yast`
```
REPO/updates/suse/setup/descr/$> ls > directory.yast
```

Tworzenie sum SHA1 plikow
```
REPO/updates/$> create_sha1sums -x -n .
```

### Podpisywanie plikow przy uzyciu klucza GPG

Podpisywanie metadanych

```
cd /srv/www/htdocs/local-nano/updates/media.1
gpg --local-user C80005E9 -b --sign --armor --passphrase-file /tmp/password --batch products
gpg --local-user C80005E9 --export --armor > products.key
ls > directory.yast
```

Podpisywanie zawartosci repozytorium

```
cd /srv/www/htdocs/local-nano/updates
gpg --local-user C80005E9 -b --sign --armor --passphrase-file /tmp/password --batch content
gpg --local-user C80005E9 --export --armor > content.key
```

### Konfiguracja NFS share

W pliku `/etc/exports`

```
/srv/www/htdocs/local-nano 193.187.69.0/24(rw,no_root_squash)
```

Uruchomienie serwera NFS

`systemctl enable --now nfs-server`

### Efekt koncowy

Na kliencie (server2):

1. Dodanie repozytorium do zyppera: `zypper addrepo nfs://193.187.69.1/srv/wwww/htdocs/local-nano local-nano`
2. Zaladowanie repozytorium wraz z wypisaniem zawartosci: `zypper packages`


Przy zaladowywaniu mozna zauwazyc ze repozytorium jest podpisane (nalezy zaakecptowac klucz).
