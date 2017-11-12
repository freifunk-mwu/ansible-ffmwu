# Ansible role service-fastd-mesh

Diese Ansible role konfiguriert die fastd-Instanz für die Knoten Kommunikation.

- stellt sicher, dass die Instanz-Verzeichnisse existieren
- schreibt fastd.conf
- schreibt secret.conf
  - der private fastd Schlüssel wird aus dem Admin passwordstore gelesen (YAML key secret)
- erstellt die erforderlichen peers Ordner
- klont die fastd peer repos
- klont bingener fastd peer repo (im Moment hardcoded)

## Instanz-Benamung
Node-Instanzen: $mesh.id + vpn + '-' + $mesh.fastd.nodes.instances.xx.mtu, z.B. "mzvpn-1312"
Intragate-Instanzen: $mesh.id + 'ig' + vpn + '-' + $mesh.fastd.intragate.instances.xx.mtu, z.B. "mzigvpn-1312"

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    site_number: # integer
    fastd:
      nodes:
        instances:
          - id: 0 # integer
            mtu: # integer
            peers:
              repo: # String - https Link zum Github Repository
              version: # String - Branch oder Commit ID
          ...
´´´
- Dictionary `fastd_secrets` (Host-Variable)
´´´
fastd_secrets:
  mzvpn: "{{ lookup('passwordstore', 'fastd/mzvpn/sparegate4 subkey=secret') }}"
  wivpn: "{{ lookup('passwordstore', 'fastd/wivpn/sparegate4 subkey=secret') }}"
  ...

´´´
- Liste `legacy_gateways`

## fastd Secrets

Die privaten Schlüssel der fastd Instanzen sind sehr sensible Informationen, weshalb wir diese in ein nicht öffentliches passwordstore ausgelagert haben.
Bevor man ein Gateway aufsetzt, müssen die privaten Schlüssel für alle benötigten fastd Instanzen generiert und im passwordstore hinterlegt werden.
Das Dictionary `fastd_secrets` folgt dem Aufbau:
```
fastd_secrets:
  $Instanz-Name: "{{ lookup('passwordstore', '$Pfad-im-passwordstore subkey=secret') }}"
```

## Abhängigkeiten

- role `service-fastd`
