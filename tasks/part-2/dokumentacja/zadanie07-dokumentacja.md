# Dokumentacja do zadania 7

## Wstep

Instalacja aplikacji Longhorn 1.4 z katalogu aplikacji ranchera.

## Przebieg wykonania

### Instalacja wymaganych elementow

Wymagane elementy:

![image](https://user-images.githubusercontent.com/128246734/226601714-fd372d2b-d7ce-4e2d-b2a2-bf940fbfc512.png)

Narzedzia z punktu 3 sa domyslnie dostepne na maszynie produkcyjnej.

#### Instalacja iscsi

Instalacja pakietu:
`zypper install open-iscsi`

Uruchamianie uslugi:
`systemctl enable --now iscsid`

### Instalacja Longhorn 1.4

`Apps -> Charts -> Longhorn`
 - `Install`
   - `Project: potyczki`

`Longhorn Storage Class Settings`
 - `Default Storage Class: check`
 - `Def. Storage Class Replica Count: 1`

### Potwierdzanie statusu podow longhorn

Zakladka z serwiasami longhorna:

![image](https://user-images.githubusercontent.com/128246734/226604262-7f7b1dcb-2ad5-4fc0-bb22-3d4d248bd366.png)
