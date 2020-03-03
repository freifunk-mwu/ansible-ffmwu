# Ansible role service-nginx-firmware-selector

Diese Ansible role installert den Firmware Selector und konfiguriert den nginx vHost.

- installert den Firmware Selector
- schreibt config.js
- schreibt firmware_selector.conf

## Benötigte Variablen

- Variable `firmware_selector_path` (Rollen Variable)
- Variable `http_firmware_selector_external` (Rollen Variable)
- Variable `http_firmware_selector_internal` (Rollen Variable)
- Variable `http_firmware_selector_prefix` # string: Subdomain
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
