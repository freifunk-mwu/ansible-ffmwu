# Ansible role service-nginx-mwu_landing_page

Diese Ansible role installert die MWU Landing-Page und konfiguriert den nginx vHost.

- installert https://github.com/freifunk-mwu/www.freifunk-mwu.de

## Benötigte Variablen

- Variable `mwu_landing_page_src` (Rollen Variable)
- Variable `mwu_landing_page_path` (Rollen Variable)
- Variable `mwu_landing_page_version` (Rollen Variable)
- Variable `http_mwu_landing_page_external` (Rollen Variable)
- Variable `http_mwu_landing_page_internal` (Rollen Variable)
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
