# Ansible role service-vnstat

Diese Ansible role installiert und konfiguriert den vnstat daemon.

- schreibt vnstat.conf

## Benötigte Variablen

- Variable `ansible_default_ipv4.interface` (Setup)

## ToDo

- Liste mit Interfaces erstellen
- Nginx vHost für vnstati Images
- Script erstellen (systemd timer), das zyklisch vnstati Images erzeugt
