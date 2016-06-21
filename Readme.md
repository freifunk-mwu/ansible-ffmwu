# ansible-ffmwu.git

An dieser Stelle soll der ganze ansible-script-junk entstehen, um ein FFMWU-Gateway automagisiert aufzusetzen. Das Geraffel kann später auch auf andere server-Typen erweitert werden, wenn sinnvoll.
Ein server muss minimal vorbereitet sein, bevor er mit den hiesigen Skripten zum Gate (oder zu Sonstigem) gemacht werden kann. Insbesondere müssen die folgenden Voraussetzungen erfüllt sein (diese werden vom playbook `test-prerequisites.yml` getestet):

- Ein dedizierter (v)server muss existieren und unter einer IPv4- und einer IPv6-Adresse öffentlich erreichbar sein.
- Die Adressen sollen im MWU-DNS eingetragen sein.
- Es muss eine nakte unterstützte linux-Version aufgesetzt sein (aktuell Ubuntu 14.04, bald Debian).
- Es muss einen user admin geben, auf den die Admins Zugriff haben; dieser muss root-Zugang über sudo haben.

Zusätzlich ist sehr empfehlenswert, dass die Admins die Maschinen mit ihren fqdns in ihrer ssh-config definiert haben.
