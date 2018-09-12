# Ansible role service-influxdb

Diese Ansible role installiert InfluxDB.

- fügt das APT Repo für InfluxDB hinzu
- installiert das Paket `influxdb` (apt)
- bindet die TCP Ports an localhost
- installiert das Paket `python-requests` (apt)
- installiert das Paket `python-influxdb` (pip)
- aktiviert die systemd unit `influxdb.service`
