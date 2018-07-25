# Ansible role service-fastd-backbone

Diese Ansible role konfiguriert die fastd-Instanz für die Intra-Server Kommunikation.

- konfiguriert xxigvpn-Instanzen
- stellt sicher, dass die Instanz-Verzeichnisse existieren
- schreibt fastd.conf
- schreibt secret.conf
  - der private fastd Schlüssel wird aus dem Admin passwordstore gelesen (YAML key secret)
- erstellt die erforderlichen peers Ordner
- klont die fastd peer repos

## Benötigte Variablen

- Dictionary `meshes`

```
meshes:
  - id: xx
...
    site_number: # integer
    fastd:
      backbone:
        instances:
          - id: 0 # integer
            mtu: # integer
            peers:
              repo: # String - https Link zum Github Repository
              version: # String - Branch oder Commit ID
            pass: # String - Pfad des fastd secrets im Admin Pass
          ...
```

## fastd Secrets

Die privaten Schlüssel der fastd Instanzen sind sehr sensible Informationen, weshalb wir diese in ein nicht öffentliches passwordstore ausgelagert haben.
Bevor man ein Gateway aufsetzt, müssen die privaten Schlüssel für alle benötigten fastd Instanzen generiert und im passwordstore hinterlegt werden.

## Abhängigkeiten

- role `service-fastd`
