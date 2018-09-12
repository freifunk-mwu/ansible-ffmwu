# Ansible role service-nginx-meshviewer

Diese Ansible role installert den Meshviewer und konfiguriert den nginx vHosts.

- schreibt config.js
- schreibt meshviewer.conf
- legt Meschviewer Verzeichnis an
- installiert Abhängigkeiten via `yarn`
- baut den Meschviewer
- installert den Meshviewer

## Benötigte Variablen

- Variable `meshviewer_src` (Rollen Variable)
- Variable `meshviewer_path` (Rollen Variable)
- Variable `http_meshviewer_external` (Rollen Variable)
- Variable `http_meshviewer_internal` (Rollen Variable)
- Variable `http_meshviewer_prefix` # string: Subdomain
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
- Dictionary `meshes`
```
meshes:
  - id: xx
...
    site_code: # string
    site_name: # string
    sites_virtual: # (optinal)
      ffxx: # string

...
    http_domain_external: # string: Externe Mesh Domain
    http_domain_internal: # string: Interne Mesh Domain
```

- Dictionary `map_layers` (Rollen Variable)

```
map_layers:
  - xxx:
    name: # string
    url: # string
    max_zoom: # integer
    attribution: # string
...
```
