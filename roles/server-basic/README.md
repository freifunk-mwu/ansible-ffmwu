# Ansible role server-basic

Diese Ansible role installiert Pakete, die auf allen MWU-Server benötigt werden.

- installiert Pakete, die auf allen Servern benötigt werden
- setzt vim als default Editor
- setzt die Zeitzone auf Europe/Berlin
- generiert und setzt default locale
- konfiguriert das dummy Kernel Modul

## Benötigte Variablen

- Liste `packages` (Rollen Variable)
- Variable `default_locale` (Rollen-Variable)

## Optionale Variablen

- Variable `debian_apt_mirror`
- Liste `additional_locales`
