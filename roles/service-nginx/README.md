# Ansible role service-nginx

Diese Ansible role installiert und konfiguriert den Web Server nginx.

- installiert das offizielle Debian Repository von nginx.org
- installiert nginx
- schreibt nginx.conf
- schreibt default.conf
- installiert die Standard MWU Server Webseite

## Benötigte Variablen

- Variable `acme_server`
- Variable `server_type`
- Variable `inventory_hostname_short`
