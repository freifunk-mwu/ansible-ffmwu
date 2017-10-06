# Ansible role service-fastd-intragate

Diese Ansible role konfiguriert die fastd-Instanz für die Intra-Server Kommunikation.

- konfiguriert xxigVPN-Instanzen
- stellt sicher, dass die Instanz-Verzeichnisse existieren
- schreibt fastd.conf
- schreibt secret.conf
  - der private fastd Schlüssel wird aus dem Admin passwordstore gelesen (YAML key secret)
- erstellt die erforderlichen peers Ordner
- klont die fastd peer repos

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
  mzigVPN: "{{ lookup('passwordstore', 'fastd/mzigVPN/sparegate4 subkey=secret') }}"
  wiigVPN: "{{ lookup('passwordstore', 'fastd/wiigVPN/sparegate4 subkey=secret') }}"
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

## Abhängigkeiten

- role `service-fastd`
