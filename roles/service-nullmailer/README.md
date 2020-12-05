# Ansible role service-nullmailer

Diese Ansible role installiert postfix und konfiguriert diesen als null client.

- schreibt /etc/mailname
- schreibt /etc/postfix/main.cf
- setzt root alias in /etc/aliases

## Benötigte Variablen

- Variable `inventory_hostname`
- Variable `mail_domain` (Gruppen-Variable)
- Liste `nullmailer_packages` (Rollen-Variable)
- Liste `nullmailer_interfaces` (Rollen-Variable)
- Liste `nullmailer_networks` (Rollen-Variable)
- Variable `nullmailer_relayhost`(Rollen-Variable)
- Variable `admin_mail_address` (Rollen-Variable)
