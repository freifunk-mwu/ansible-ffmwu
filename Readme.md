# Ansible Freifunk MWU

Wir, die Freifunk MWU Community, nutzen Ansible um unsere Freifunk Server aufzusetzen und zu konfigurieren. In
diesem Repository verwalten wir unsere Ansible Roles und Playbooks.

Ein Server muss minimal vorbereitet sein, bevor dieser per Ansible z.B. zu einem Freifunk-Gateway gemacht werden 
kann. Die folgenden Voraussetzungen müssen erfüllt sein:

- Ein dedizierter (v)server muss existieren und unter einer IPv4- und einer IPv6-Adresse öffentlich erreichbar sein.
- Die Adressen müssen im MWU-DNS eingetragen sein.
- Als Betriebssystem muss Debian stretch installiert sein.
- Für ansible muss Python 2.5 oder Python 2.4 + python-simplejson installiert sein.
- Es muss einen User admin geben, auf den die Admins Zugriff haben; dieser muss Root-Zugang über sudo haben.

Die Voraussetzungen werden von der Rolle `prerequisites` geprüft, die Rolle sollte als erste Rolle in jedem
Playbook eingebunden sein.

Die Server werden mit ihren FQDNs im Ansible Inventory hinterlegt, bedenkt das für eure ssh-config.

## Variablen für jedes Mesh

Viele Rollen brauchen spezifische Informationen, wie IP-Adresse, Masken, Interface-Namen, etc.
Wir verwalten diese Mesh-Informationen in einem Dictionary unter `inventory/group_vars/all`:

```
meshes:
  mz:
    site_number: 37
    site_code: ffmz
    site_name: Mainz
    ipv4_network: 10.37.0.0/18
    ipv6:
      ula:
        - fd37:b4dc:4b1e::/48
      public:
        - 2a03:2260:11a::/48
    dnssl:
      - ffmz.org
      - user.ffmz.org
    batman:
      it: 10000
      gw: server 96mbit/96mbit
      mm: 0
      dat: 0
      hop_penalty: 60
    radvd:
      maxrtradvinterval: 900
      advvalidlifetime: 864000
      advpreferredlifetime: 172800
    iface_mtu: 1350
    peers_mesh_repo: https://github.com/freifunk-mwu/peers-ffmz.git
    peers_intragate_repo: https://github.com/freifunk-mwu/ffmz-infrastructure-peers.git
    dns:
      master: fd37:b4dc:4b1e::a25:103
      forward_zones:
        ffmz.org:
        user.ffmz.org:
        bb.ffmz.org:
        nodes.ffmz.org:
        ffbin:
          master: fd37:b4dc:4b1e::a25:10c

  wi:
    site_number: 56
    site_code: ffwi
    site_name: Wiesbaden
    ipv4_network: 10.56.0.0/18
    ipv6:
      ula:
        - fd56:b4dc:4b1e::/48
      public:
        - 2a03:2260:11b::/48
    dnssl:
      - ffwi.org
      - user.ffwi.org
    batman:
      it: 10000
      gw: server 96mbit/96mbit
      mm: 0
      dat: 0
      hop_penalty: 60
    radvd:
      maxrtradvinterval: 900
      advvalidlifetime: 864000
    iface_mtu: 1350
    peers_mesh_repo: https://github.com/freifunk-mwu/peers-ffwi.git
    peers_intragate_repo: https://github.com/freifunk-mwu/ffwi-infrastructure-peers.git
    dns:
      master: fd56:b4dc:4b1e::a38:103
      forward_zones:
        ffwi.org:
        user.ffwi.org:
        bb.ffwi.org:
        nodes.ffwi.org:
```

## Sensible Informationen

Sensible Daten, z.B. private keys für Dienste wie fastd und tinc verwalten wir in einem [Password Store](https://www.passwordstore.org/).
Falls ihr mehrere Password Stores verwaltet, denkt vor Benutzung von Ansible daran, die Umgebungsvariable auf den richtigen Store zu verweisen:
```
export PASSWORD_STORE_DIR=...
```

## Aufsetzen eines neuen Gateways

- FQDN im Inventory zur Gruppe ffmwu-gateways hinzufügen
- Host-Variablen setzen
  - inventory/host_vars/$FQDN

```
---
# Gateway-Nummer, von der vieles abgeleitet wird. Integer zwischen 1-254. Muss eindeutig unter allen FFMWU Servern sein.
magic:

# Die Nummer des /22er IPv4-Subnetzes, das per DHCP verteilt werden soll.
ipv4_dhcp_range:

# FFRL (muss vorher bereits zugewiesen worden sein)
# Öffentliche IPv4 NAT Adresse, Format: IP/Prefix
ffrl_public_ipv4_nat:

ffrl_exit_server:
  ffrl-a-ak-ber:
    public_ipv4_address: 185.66.195.0
    tunnel_ipv4_network: # Format: IP/Maske
    tunnel_ipv6_network:
  ffrl-b-ak-ber:
    public_ipv4_address: 185.66.195.1
    tunnel_ipv4_network: # Format: IP/Maske
    tunnel_ipv6_network:
  ffrl-a-ix-dus:
    public_ipv4_address: 185.66.193.0
    tunnel_ipv4_network: # Format: IP/Maske
    tunnel_ipv6_network:
  ffrl-b-ix-dus:
    public_ipv4_address: 185.66.193.1
    tunnel_ipv4_network: # Format: IP/Maske
    tunnel_ipv6_network:
  ffrl-a-fra2-fra:
    public_ipv4_address: 185.66.194.0
    tunnel_ipv4_network: # Format: IP/Maske
    tunnel_ipv6_network:
  ffrl-b-fra2-fra:
    public_ipv4_address: 185.66.194.1
    tunnel_ipv4_network: # Format: IP/Maske
    tunnel_ipv6_network:

# Pfade zu den fastd secrets im passwordstore
fastd_secrets:
  mzVPN: "{{ lookup('passwordstore', 'fastd/mzVPN/$Hostname subkey=secret') }}"
  wiVPN: "{{ lookup('passwordstore', 'fastd/wiVPN/$Hostname subkey=secret') }}"
  mzigVPN: "{{ lookup('passwordstore', 'fastd/mzVPN/$Hostname subkey=secret') }}"
  wiigVPN: "{{ lookup('passwordstore', 'fastd/wiVPN/$Hostname subkey=secret') }}"

# Pfade zum tinc secret im passwordstore
tinc_private_key: "{{ lookup('passwordstore', 'tinc/icVPN/$hostname_private returnall=true') }}"
```
- Neues Gateway aufsetzen per `ansible-playbook playbooks/gateways.yml`
  - Hierbei werden die definierten Rollen auch auf schon aufgesetzte Gateways angewandt, was unkritisch ist, weil wir unsere Rollen idempotent schreiben.
  - Um die Rollen nur auf das neu aufzusetzende Gateway anzuwenden: `ansible-playbook playbooks/gateways.yml --limit=$FQDN`
