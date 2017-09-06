# Ansible role git-fastd-peers
Diese Ansible role hängt von der role service-fastd-mesh bzw. service-fastd-intragate ab und sollte danach ausgeführt werden.

- installiert die erforderlichen git Pakete
- erstellt die erforderlichen peers Ordner
- klont die fastd peer repos

## Abhängigkeiten:
- service-fastd-*

## Benötigte Variablen
- Dictionary `meshes`
```
meshes:
  xx:
...
    peers_mesh_repo: # String - https Link zum Github Repository
    peers_intragate_repo: # String - https Link zum Github Repository

´´´

