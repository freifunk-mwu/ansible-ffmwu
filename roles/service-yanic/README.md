# Ansible role service-yanic

Diese Ansible role installiert Yanic.

- legt den Benutzer und Gruppe für Yanic an
- legt das Yanic Verzeichnis aus
- legt die InfluxDB Datenbank für Yanic an
- schreibt yanic.conf
- schreibt yanic.service
- kompiliert und installiert Yanic
- aktiviert die systemd unit `yanic.service`

# Benötigte Variablen

- Variable `gopath`

# Optionale Variablen

- Variable `yanic_user`
- Variable `yanic_home`
- Variable `yanic_path`
- Variable `yanic_config`
- Variable `yanic_database`
