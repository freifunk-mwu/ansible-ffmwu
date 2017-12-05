# Ansible role service-respondd

Diese Ansible role installiert und konfiguriert die respondd Implementierung `mesh-announce`.
Pro Mesh Netzwerk muss eine `mesh-announce`-Instanz laufen.

- installiert `mesh-announce` (Github Clone)
- installiert pro Mesh Netzwerk eine systemd unit

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
    site_code: # string
´´´
