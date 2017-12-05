# Ansible role server-apt-repos

Diese Ansible role konfiguriert zusätzliche APT Repositories.

- installiert Freifunk MWU Debian APT PGP Key
- konfiguriert APT Repositories aus der Liste `repos`

## Benötigte Variablen

- Liste `repos` (Rollen Variable)
  - `name`: String == Name der Konfigurationsdatei unter /etc/apt/sources.list.d
  - `repo`: String
  - `update_cache`: yes|no
