# Dokumentacja do zadania 3

## Wstep

### Certyfikat SSL

Certyfikat SSL wygenerowalem przy uzyciu narzedzia `certbot` oferujacego certyfikaty od LetsEncrypt.

## Potrzebne skladniki

 - certbot
   - `zypper install python3-certbot`
 - apache2 (juz zainstalowany w zadaniu 1)
 - moduł SSL w apache (domyslnie dostepny)

## Przebieg wykonania

### Generowanie certyfikatu

Korzystając z `certbot`

`certbot certonly -d team05.oedu.pl`

Nalezy wypelnic proszone dane i wybrac tryb weryfikacji `2` czyli `webroot`

Jako webroot nalezy podac: `/srv/www/htdocs/`

Otrzymane pliki:
 - `/etc/letsencrypt/live/team05.oedu.pl/fullchain.pem` - Certyfikat
 - `/etc/letsencrypt/live/team05.oedu.pl/privkey.pem` - Klucz Prywatny

### Konfiguracja Apache2

Plik `/etc/apache2/listen.conf`:

```
Listen 80

<IfModule mod_ssl.c>
	Listen 443
</IfModule>
```

Plik `/etc/apache2/vhosts.d/team05.conf`:

```
<VirtualHost team05.oedu.pl:443>
        ServerName team05.oedu.pl
        DocumentRoot "/srv/www/htdocs"
        ErrorLog /var/log/apache2/error_log
        TransferLog /var/log/apache2/access_log

        SSLEngine on

        SSLCertificateFile /etc/letsencrypt/live/team05.oedu.pl/fullchain.pem
        SSLCertificateKeyFile /etc/letsencrypt/live/team05.oedu.pl/privkey.pem
</VirtualHost>
```

### Restart Apache2

Po dokonaniu zmian nalezy uruchomic usluge apache2 ponownie:

`systemctl restart apache2`

## Efekt koncowy

Po wejsciu na strone https://team05.oedu.pl powinna wyswietlic sie jej zawartosc, a strona powinna byc zabezpieczona certyfikatem.