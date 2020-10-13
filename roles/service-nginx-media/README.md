# Ansible role service-nginx-media

Diese Ansible role installiert h5ai und konfiguriert den nginx vHost.

- installiert h5ai
- schreibt media.conf
- legt media Verzeichnis an

## Benötigte Variablen

- Variable `media_path` (Rollen Variable)
- Variable `http_media_external` (Rollen Variable)
- Variable `http_media_internal` (Rollen Variable)
- Variable `http_media_prefix` # string: Subdomain
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
