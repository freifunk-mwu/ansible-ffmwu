# ansible-ffmwu.git

An dieser Stelle soll der ganze ansible-script-junk entstehen, um ein FFMWU-Gateway automagisiert aufzusetzen. Das Geraffel kann später auch auf andere server-Typen erweitert werden, wenn sinnvoll.
Ein server muss minimal vorbereitet sein, bevor er mit den hiesigen Skripten zum Gate (oder zu Sonstigem) gemacht werden kann. Insbesondere müssen die folgenden Voraussetzungen erfüllt sein (diese werden vom playbook `test-prerequisites.yml` getestet):

- Ein dedizierter (v)server muss existieren und unter einer IPv4- und einer IPv6-Adresse öffentlich erreichbar sein.
- Die Adressen sollen im MWU-DNS eingetragen sein.
- Es muss eine nakte unterstützte linux-Version aufgesetzt sein (aktuell Ubuntu 14.04, bald Debian).
- Es muss einen user admin geben, auf den die Admins Zugriff haben; dieser muss root-Zugang über sudo haben.

Zusätzlich ist sehr empfehlenswert, dass die Admins die Maschinen mit ihren fqdns in ihrer ssh-config definiert haben.

Bisher gibt es hier zwei Sammlungen von files: zum Einen der Beginn des eigentlichen Zwecks: bisher kann eine Rolle (auf Basis der obigen Voraussetzungen) alle FFMWU-Server in dem ihnen allen identischen Aspekt vorberein, der Pflege der ssh keys der admins. Zum Anderen gibt es ein playbook, das eine lokale Test-VM aufsetzt, auf der man alle eigentlichen playbooks und Rollen testen kann, ohne ernsthaften Schaden anzurichten.

## Aufsetzen und Pflegen von Gateways

Alle FFMWU-Gatways sind auch FFMWU-Server, alle anderen server bei uns überraschenderweise auch; so sind auch alle im inventory in der Gruppe 'ff-servers' zusammengefasst. Der Aspekt, der allen FFMWU-Servern gemein ist, sind die ssh-keys der admins. Auf einigen servern gibt es allerdings weitere Zugriffsberechtigte (spezialisiert admins).

So gibt es eine Rolle ('ffmwu-server'), die allen hosts dieser Gruppe zugewiesen ist (über das playbook 'ffmwu-servers.yml'). Dieses playbook (einfach starten) weist die Rolle dazu, welche ihrerseits die shh keys auf den hosts pflegt.

Die Rolle besteht aus nur einem task und einer definierten Variable, die die keys der admins enthält. Sind auf einem host weitere ssh keys von Nöten, so werden disse als hostvar definiert.

## Erzeugen einer test-VM

Um die playbooks und Rollen gefahrlos testen zu können, bietet sich ein test host an. Hierfür kenn eine lokale VM zu Einsatz kommen, wenn die Voraussetzungen stimmen.

Damit auf der lokalen Maschine (der ansible controle machine) VMs ablaugen können, müssten verschiedene Voraussetzungen erfüllt sein. U. a.:

- installierte Pakete zu libvirt, kvm und qemu und Pakete virt-manager, isomaster
- >15G freier Plattenplatz
- ansible >= 2.1

Leifer sind die letzten 2 Meter der Aufgabe offenbar nicht automatisierbar. Deshalb muss der user an einer Stelle mit 'isomaster'kurz etwas manuell durchführen
Das playbook 'loctevm-reset.yml' einfach ausführen.

### bekannte Probleme

- Oft kann ansible die erzeugt VM nicht starten (um die debian-Installation anzustoßen; per Pedes (mit virt-manager) sollte es aber funktionieren.
- Ein Schritt scheint nicht automagisierbar, hier werden isomaster & der user benötigt.
- Beim ersten Start werden gelegentlich Laufwerke nicht akzeptiert.
- Bisher wird direkt die 64bit-Version ausgewählt.
