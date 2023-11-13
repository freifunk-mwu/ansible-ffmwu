# Ansible role service-nginx-meshviewer

Diese Ansible role installiert den Meshviewer und konfiguriert den nginx vHosts.

- legt Meshviewer Verzeichnis an
- installert Meshviewer
- schreibt config.json
- schreibt meshviewer.conf
- schreibt tiles.conf

## Benötigte Variablen

- Variable `meshviewer_deprecation_text` (Rollen Variable)
- Variable `meshviewer_src` (Rollen Variable)
- Variable `meshviewer_path` (Rollen Variable)
- Variable `http_meshviewer_external` (Rollen Variable)
- Variable `http_meshviewer_internal` (Rollen Variable)
- Variable `http_meshviewer_prefix` # string: Subdomain
- Variable `http_tiles_external` (Rollen Variable)
- Variable `http_tiles_internal` (Rollen Variable)
- Variable `http_tiles_prefix` # string: Subdomain
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
