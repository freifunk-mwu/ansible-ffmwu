# Ansible role service-yanic

Diese Ansible role installiert Yanic.

- legt den Benutzer und Gruppe für Yanic an
- legt das Yanic Verzeichnis aus
- legt die InfluxDB Datenbank für Yanic an
- kompiliert und installiert Yanic
- schreibt yanic.conf
- schreibt yanic.service
- schreibt respondd.conf
- schreibt respondd.service
- aktiviert die systemd unit `yanic.service`
- aktiviert die systemd unit `respondd.service`

# Benötigte Variablen

- Variable `gopath`

# Optionale Variablen

- Variable `yanic_user`
- Variable `yanic_home`
- Variable `yanic_path`
- Variable `yanic_database`
- Variable `yanic_config`
- Variable `respondd_config`
