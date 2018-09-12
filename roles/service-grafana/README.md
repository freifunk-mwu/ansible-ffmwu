# Ansible role service-grafana

Diese Ansible role installiert Grafana und legt den nginx vHost an.

- fügt das APT Repo für Grafana hinzu
- installiert das Paket `grafana`
- schreibt grafana.ini
- schreibt grafana.conf
- aktiviert die systemd unit `grafana-server.service`

## Benötigte Variablen
- Variable `http_grafana_internal` (Rollen Variable)
- Variable `http_grafana_external` (Rollen Variable)
- Variable `http_grafana_prefix` # string: Subdomain
