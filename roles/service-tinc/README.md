# Ansible role service-tinc

Diese Ansible role installiert und konfiguriert den tinc daemon, der für die Verbindung in das InterCity-VPN benötigt wird.

- installiert tinc
- erzeugt icvpn tinc Instanz
  - klont freifunk/icvpn repo
  - schreibt tinc.conf
  - schreibt tinc-up hook script
  - schreibt tinc-down hook script
  - liest tinc private key aus dem pass

## Benötigte Variablen

- Dictionary `icvpn`
```
icvpn:
  prefix: mwu
  interface: icvpn
  icvpn_repo: https://github.com/freifunk/icvpn
```
- Variable `icvpn_ipv4_transfer_net`
- Variable `icvpn_ipv6_transfer_net`
- Dictionary `routing_tables`
```
routing_tables:
  icvpn: 23
  ...
```
- Host Variable `magic`
- Host Variable `tinc_private_key`
```
tinc_private_key: "{{ lookup('passwordstore', 'tinc/icvpn/$Hostname_private returnall=true') }}"
```

## tinc private key

Der private Schlüssel der icvpn tinc-Instanz liegt im passwordstore.
Bevor man ein Gateway aufsetzt, muss der private Schlüssel generiert und im passwordstore hinterlegt werden.
Die Variable `tinc_private_key` folgt dem Aufbau:
```
tinc_private_key:
  $Instanz-Name: "{{ lookup('passwordstore', '$Pfad-im-passwordstore returnall=true') }}"
```

