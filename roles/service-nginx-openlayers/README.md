# Ansible role service-nginx-openlayers

Diese Ansible role installert OpenLayers und konfiguriert den nginx vHosts.

- schreibt openlayers.conf
- legt OpenLayers Verzeichnis an
- installert OpenLayers

## Benötigte Variablen

- Variable `openlayers_src` (Rollen Variable)
- Variable `openlayers_path` (Rollen Variable)
- Variable `openlayers_version` (Rollen Variable)
- Variable `http_openlayers_external` (Rollen Variable)
- Variable `http_openlayers_internal` (Rollen Variable)
- Variable `http_openlayers_prefix` # string: Subdomain
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
