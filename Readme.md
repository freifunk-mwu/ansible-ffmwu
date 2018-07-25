# Ansible Freifunk MWU

Wir, die Freifunk MWU Community, nutzen Ansible um unsere Freifunk Server aufzusetzen und zu konfigurieren. In
diesem Repository verwalten wir unsere Ansible Roles und Playbooks.

Ein Server muss minimal vorbereitet sein, bevor dieser per Ansible z.B. zu einem Freifunk-Gateway gemacht werden 
kann. Die folgenden Voraussetzungen müssen erfüllt sein:

- Ein dedizierter (v)server muss existieren und unter einer IPv4- und einer IPv6-Adresse öffentlich erreichbar sein.
- Die Adressen müssen im MWU-DNS eingetragen sein.
- Als Betriebssystem muss Debian Stretch installiert sein.
- Für Ansible muss Python 2.6 oder höher installiert sein.
- Es muss einen User admin geben, auf den die Admins Zugriff haben; dieser muss Root-Zugang über sudo haben.

Diese Voraussetzungen werden von der Rolle `prerequisites` geprüft, die Rolle sollte als erste Rolle in jedem
Playbook eingebunden sein.

Voraussetzungen für die Control Machine:

- Python 2 (Versionen 2.6 oder 2.7) oder 3 (Versionen 3.5 oder höher)
- Ansible Version >= 2.4.0.0
- Python Modul `netaddr`
- Python Modul `dnspython`

Die Server werden mit ihren FQDNs im Ansible Inventory hinterlegt, bedenkt das für eure ssh-config.

## Gruppen-Variablen
Viele Variablen sind Mesh-spezifisch und werden auf allen Gateways benötigt. Deshalb verwalten wir die Liste `meshes`. Jeder Listeneintrag ist ein Dictionary. Diese Liste befindet sich in der Sondergruppe `all` (inventory/group_vars/all) und steht damit allen Hosts im Inventory zur Verfügung.
Diese Liste ist quasi das Herzstück zur Konfiguration der Mesh-spezifischen Parameter auf den Freifunk-Gateways. Jedes Dictionary repräsentiert eine Mesh-Wolke/Domain/Layer2-Netzwerk und ist wie folgt aufgebaut (Beispiel Mainz):

|Name|Type|Value|Format|Comment|
|----|----|-----|------|-------|
|id  |Variable|mz|string|Zum Teil werden Interface-Namen davon abgeleitet, z.B. `mzbr` oder `mzbat`|
|site_number|Variable|37|integer|Fließt in IP-Adress-Berechnung ein|
|site_code|Variable|ffmz|string||
|site_name|Variable|Mainz|string||
|ipv4_network|Variable|10.37.0.0/18|string; Network/Prefix||
|ipv6_ula|List|- fd37:b4dc:4b1e::/48|string; Network/Prefix||
|ipv6_public|List|- 2a03:2260:11a::/48|string; Network/Prefix||
|dnssl|List|- ffmz.org|string|DNS Search List (dhcp/radvd)|
|batman|Dictionary||||
|batman.it|Key|10000|integer||
|batman.gw|Key|server 96mbit/96mbit|string||
|batman.mm|Key|0|boolean||
|batman.dat|Key|0|boolean||
|batman.hop_penalty|Key|60|integer||
|radvd|Dictionary||||
|radvd.maxrtradvinterval|Key|900|integer||
|radvd.advvalidlifetime|Key|864000|integer||
|radvd.advpreferredlifetime|Key|172800|integer||
|iface_mtu|Variable|1350|integer|Client MTU|
|fastd|Dictionary||||
|fastd.nodes|Dictionary||||
|fastd.nodes.instances|List|||Jeder Listeneintrag ist ein Dictionary; Instanzen für Node-Kommunikation|
|fastd.nodes.instances[x].id|Key|0|integer||
|fastd.nodes.instances[x].mtu|Key|1406|integer||
|fastd.nodes.instances[x].peers|Dictionary||||
|fastd.nodes.instances[x].peers.repo|Key|https://github.com/freifunk-mwu/peers-ffmz.git|URL||
|fastd.nodes.instances[x].peers.version|Key|master|string||
|fastd.nodes.instances[x].pass|Key|fastd/mzvpn|string||
|fastd.backbone|Dictionary||||
|fastd.backbone.instances|List|||Jeder Listeneintrag ist ein Dictionary; Instanzen für Intra-Server-Kommunikation|
|fastd.backbone.instances[x].id|Key|0|integer||
|fastd.backbone.instances[x].mtu|Key|1406|integer||
|fastd.backbone.instances[x].peers|Dictionary||||
|fastd.backbone.instances[x].peers.repo|Key|https://github.com/freifunk-mwu/ffmz-infrastructure-peers.git|URL||
|fastd.backbone.instances[x].peers.version|Key|master|string||
|fastd.backbone.instances[x].pass|Key|fastd/mzigvpn|string||
|dns|Dictionary||||
|dns.master|Key|fd37:b4dc:4b1e::a25:103|string; IP-Adresse|DNS-Master IP|
|dns.forward_zones|List||||
|dns.forward_zones[x].name|Key|ffmz.org|string||
|dns.forward_zones[x].master|Key|fd37:b4dc:4b1e::a25:10c|string; IP-Adresse|Optional - überschreibt dns.master|
|http_domain_internal|Variable|ffmz.org|string|Haupt-Domain für HTTP-Server(intern)|
|http_domain_external|Variable|freifunk-mainz.de|string|Haupt-Domain für HTTP-Server(extern)||

Weitere Gruppen-Variablen:

|Name|Type|Value|Format|Comment|
|----|----|-----|------|-------|
|as_private_mwu|Variable|65037|integer|Privates AS von Freifunk MWU|
|as_public_ffrl|Variable|201701|integer|Public AS von Freifunk Rheinland|
|internet_exit_tcp_mss_ipv4|Variable|1240|integer|IPv4 TCP MSS|
|internet_exit_tcp_mss_ipv6|Variable|1220|integer|IPv6 TCP MSS|
|routing_tables|Dictionary||||
|routing_tables.icvpn|Key|23|integer||
|routing_tables.mwu|Key|41|integer||
|routing_tables.internet|Key|61|integer||
|icvpn_ipv4_transfer_net|Variable|10.207.0.0/16|string; Network/Prefix|ICVPN IPv4 Transfernetz|
|icvpn_ipv6_transfer_net|Variable|fec0::a:cf:0:0/96|string; Network/Prefix|ICVPN IPv6 Transfernetz|
|bgp_loopback_net|Variable|10.37.0.0/18|string; Network/Prefix|MWU Loopback Netz für dynamisches Routing|
|bgp_ipv4_transfer_net|Variable|10.37.0.0/18|string; Network/Prefix|MWU IPv4 Transfernetz für dynamisches Routing|
|bgp_ipv6_transfer_net|Variable|fd37:b4dc:4b1e::/64|string; Network/Prefix|MWU IPv6 Transfernetz für dynamisches Routing|
|http_domain_internal|Variable|ffmwu.org|string|Haupt-Domain für HTTP-Server(intern)|
|http_domain_external|Variable|freifunk-mwu.de|string|Haupt-Domain für HTTP-Server(extern)|
|icvpn|Dictionary|||ICVPN Informationen|
|icvpn.prefix|Key|mwu|string|Prefix für MWU Gateways,  z.B. `mwu7` für Spinat|
|icvpn.interface|Key|icvpn|string|Name für ICVPN Interface + tinc Instanz|
|icvpn.icvpn_repo|Key|https://github.com/freifunk/icvpn|string|URL zum freifunk/icvpn Repository|
|bgp_mwu_servers|Dictionary|||Enthält pro BGP MWU peer ein Dictionary - IP-Adressen aus bgp_ipvX_transfer_net|
|bgp_mwu_servers.spinat|Dictionary||||
|bgp_mwu_servers.spinat.ipv4|Variable|10.37.0.7|string - IPv4-Adresse||
|bgp_mwu_server.spinat.ipv6|Variable|fd37:b4dc:4b1e::a25:7|string - IPv6-Adresse||


## Host-Variablen
Alle Server- bzw. Gateway-spezifischen Parameter werden als Host-Variablen abgebildet:

|Name|Type|Value|Format|Comment|
|----|----|-----|------|-------|
|magic|Variable|7|integer|Muss eindeutig unter allen Servern sein|
|ipv4_dhcp_range|Variable|6|integer|Wenn man das Mesh-Netz (/18) in /22er-Subnetze unterteilt und durchnummeriert, ist der Wert hier die Nummer des zu verwendenden /22er Subnetzes zwecks DHCP-Adress-Vergabe|
|ffrl_public_ipv4_nat|Variable|185.66.195.32/32|IP/Prefix|Öffentliche IPv4-NAT-Adresse|
|ffrl_exit_server|Dictionary|||Enthält pro FFRL Tunnel ein Dictionary|
|ffrl_exit_server.ffrl-a-ak-ber|Dictionary|||Name = Interface|
|ffrl_exit_server.ffrl-a-ak-ber.public_ipv4_address|Key|185.66.195.0|IP-Adresse|IP-Adresse der Tunnel-Gegenstelle|
|ffrl_exit_server.ffrl-a-ak-ber.tunnel_ipv4_network|Key|100.64.2.226/31|Network/Prefix|Internes IPv4-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-a-ak-ber.tunnel_ipv6_network|Key|2a03:2260:0:17b::/64|Network/Prefix|Internes IPv6-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-b-ak-ber|Dictionary|||Name = Interface|
|ffrl_exit_server.ffrl-b-ak-ber.public_ipv4_address|Key|185.66.195.1|IP-Adresse|IP-Adresse der Tunnel-Gegenstelle|
|ffrl_exit_server.ffrl-b-ak-ber.tunnel_ipv4_network|Key|100.64.2.228/31|Network/Prefix|Internes IPv4-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-b-ak-ber.tunnel_ipv6_network|Key|2a03:2260:0:17c::/64|Network/Prefix|Internes IPv6-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-a-ix-dus|Dictionary|||Name = Interface|
|ffrl_exit_server.ffrl-a-ix-dus.public_ipv4_address|Key|185.66.193.0|IP-Adresse|IP-Adresse der Tunnel-Gegenstelle|
|ffrl_exit_server.ffrl-a-ix-dus.tunnel_ipv4_network|Key|100.64.2.230/31|Network/Prefix|Internes IPv4-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-a-ix-dus.tunnel_ipv6_network|Key|2a03:2260:0:17d::/64|Network/Prefix|Internes IPv6-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-b-ix-dus|Dictionary|||Name = Interface|
|ffrl_exit_server.ffrl-b-ix-dus.public_ipv4_address|Key|185.66.193.1|IP-Adresse|IP-Adresse der Tunnel-Gegenstelle|
|ffrl_exit_server.ffrl-b-ix-dus.tunnel_ipv4_network|Key|100.64.2.232/31|Network/Prefix|Internes IPv4-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-b-ix-dus.tunnel_ipv6_network|Key|2a03:2260:0:17e::/64|Network/Prefix|Internes IPv6-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-a-fra2-fra|Dictionary|||Name = Interface|
|ffrl_exit_server.ffrl-a-fra2-fra.public_ipv4_address|Key|185.66.194.0|IP-Adresse|IP-Adresse der Tunnel-Gegenstelle|
|ffrl_exit_server.ffrl-a-fra2-fra.tunnel_ipv4_network|Key|100.64.0.186/31|Network/Prefix|Internes IPv4-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-a-fra2-fra.tunnel_ipv6_network|Key|2a03:2260:0:63::/64|Network/Prefix|Internes IPv6-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-b-fra2-fra|Dictionary|||Name = Interface|
|ffrl_exit_server.ffrl-b-fra2-fra.public_ipv4_address|Key|185.66.194.1|IP-Adresse|IP-Adresse der Tunnel-Gegenstelle|
|ffrl_exit_server.ffrl-b-fra2-fra.tunnel_ipv4_network|Key|100.64.0.188/31|Network/Prefix|Internes IPv4-Tunnel-Subnetz|
|ffrl_exit_server.ffrl-b-fra2-fra.tunnel_ipv6_network|Key|2a03:2260:0:64::/64|Network/Prefix|Internes IPv6-Tunnel-Subnetz|

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
# z.B. 5 für 10.X.16.0/22 (fünftes /22 Subnetz aus 10.X.0.0/18)
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
```
- Neues Gateway aufsetzen per `ansible-playbook playbooks/gateways.yml`
  - Hierbei werden die definierten Rollen auch auf schon aufgesetzte Gateways angewandt, was unkritisch ist, weil wir unsere Rollen idempotent schreiben.
  - Um die Rollen nur auf das neu aufzusetzende Gateway anzuwenden: `ansible-playbook playbooks/gateways.yml --limit=$FQDN`
