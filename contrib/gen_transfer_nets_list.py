#!/usr/bin/env python3

import sys
import yaml

from jinja2 import Template

wiki_tmpl = Template('''{| class="wikitable sortable"
!IPv4
!Peer A
!Peer B
!Port
{%- for network in networks %}
|-
|{{ network.ipv4 }}
|{{ network.peera }}
|{{ network.peerb }}
|{{ network.port }}
{%- endfor %}
|}''')

with open('inventory/group_vars/all', 'r') as f:
    group_vars = yaml.safe_load(f)

networks = []
for net in group_vars['wireguard_networks']:
    networks.append({'ipv4': net['ipv4'],
                     'peera': net['peers'][0],
                     'peerb': net['peers'][1],
                     'port': net['port']})

wiki_table = wiki_tmpl.render(networks=networks)
print(wiki_table)
