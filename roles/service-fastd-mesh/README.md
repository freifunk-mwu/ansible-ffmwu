# Ansible role service-fastd-mesh

Diese Ansible role installiert und konfiguriert die fastd-Instanz für die Knoten Kommunikation.

- installiert fastd
- konfiguriert xxVPN-Instanzen
- stellt sicher, dass die Instanz-Verzeichnisse existieren
- schreibt fastd.conf
- schreibt secret.conf
  - der private fastd Schlüssel wird aus dem Admin passwordstore gelesen (YAML key secret)

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  xx:
...
    site_number: # integer
´´´
- Dictionary `fastd_secrets` (Host-Variable)
´´´
fastd_secrets:
  mzVPN: "{{ lookup('passwordstore', 'fastd/mzVPN/sparegate4 subkey=secret') }}"
  wiVPN: "{{ lookup('passwordstore', 'fastd/wiVPN/sparegate4 subkey=secret') }}"
  ...

´´´

## fastd Secrets

Die privaten Schlüssel der fastd Instanzen sind sehr sensible Informationen, weshalb wir diese in ein nicht öffentliches passwordstore ausgelagert haben.
Bevor man ein Gateway aufsetzt, müssen die privaten Schlüssel für alle benötigten fastd Instanzen generiert und im passwordstore hinterlegt werden.
Das Dictionary `fastd_secrets` folgt dem Aufbau:
```
fastd_secrets:
  $Instanz-Name: "{{ lookup('passwordstore', '$Pfad-im-passwordstore subkey=secret') }}"
```
