# Ansible role users

Diese Ansible role konfiguriert System- und Admin-Benutzer.

- installiert sudo
- stellt sicher, dass gewünschte Benutzer angelegt sind
- erstellt pro Benutzer eine sudoers Datei unter /etc/sudoers.d

## Benötigte Variablen

- Liste `system_users` # Pro Listeneintrag ein dict für System-Benutzer
  - `name` # Benutzername
  - `comment`
  - `shell`
  - `home`
  - `state`
  - `ssh_keys` # Erwartet eine Liste wie z.B. `ssh_keys_admin_team`
- Liste `admin_users` # Pro Listeneintrag ein dict für Admin-Benutzer
- Liste `ssh_keys_admin_team` # Pro Listeneintrag ein dict für Public Keys
  - `name`
    `ssh_public_key`
