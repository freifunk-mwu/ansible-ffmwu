# Ansible role service-domain-director

Diese Ansible role installiert den Domain Director und legt den nginx vHost an.

- installiert das pip Paket `grafana`
- schreibt config.yml
- schreibt domain.geojson
- schreibt domain-director.service
- aktiviert die systemd unit `domain-director.service`

## Benötigte Variablen
- Variable `http_director_internal` (Rollen Variable)
- Variable `http_director_prefix` # string: Subdomain
