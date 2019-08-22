# Ansible role service-nginx-unms

Diese Ansible role konfiguriert ausschließlich den erforderlichen nginx vHost. Benötigt eine Installation von unms, die auf den entsprechenden ports lauscht.

- Verwaltet unifi vhost

## Benötigte Variablen

- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
