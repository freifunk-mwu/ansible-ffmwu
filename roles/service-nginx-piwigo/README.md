# Ansible role service-nginx-piwigo

Diese Ansible role installert Piwigo und konfiguriert den nginx vHost.

- schreibt piwigo.conf
- schreibt database.inc.php
- legt piwigo Verzeichnis an
- installert piwigo

## Benötigte Variablen

- Variable `piwigo_src` (Rollen Variable)
- Variable `piwigo_path` (Rollen Variable)
- Variable `http_piwigo_external` (Rollen Variable)
- Variable `http_piwigo_internal` (Rollen Variable)
- Variable `http_piwigo_prefix` # string: Subdomain
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
