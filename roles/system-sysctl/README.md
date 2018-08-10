# Ansible role system-sysctl
Diese Ansible role setzt Freifunk spezifische sysctl-Parameter.

## Benötigte Variablen
- List `sysctl_settings` (Rollen-Variable)

```
sysctl_settings:
  - name:	# sysctl-Parameter
    value:      # zu setzender Wert
...
```
