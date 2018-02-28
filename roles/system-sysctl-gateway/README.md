# Ansible role system-sysctl-gateway
Diese Ansible role setzt Freifunk Gateway spezifische sysctl-Parameter.

## Benötigte Variablen
- List `sysctl_settings_gateway` (Rollen-Variable)

```
sysctl_settings_gateway:
  - name:	# sysctl-Parameter
    value:      # zu setzender Wert
...
```
