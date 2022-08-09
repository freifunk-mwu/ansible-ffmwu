#!/usr/bin/env python3

import sys
import yaml

from jinja2 import Template

wiki_tmpl = Template('''{| class="wikitable sortable"
!Gateway
!Domain
!IPv4
!IPv6
{%- for network in networks %}
|-
|{{ network.gate }}
|{{ network.dom }}
|{{ network.ipv4 }}
|{{ network.ipv6 }}
{%- endfor %}
|}''')

with open('inventory/gateways', 'r') as f:
    hosts = f.read().splitlines()

hosts.remove('[gateways]')
hosts = filter(None, hosts)

networks = []
for host_fqdn in hosts:
    host = host_fqdn.split('.')[0].capitalize()

    with open('inventory/host_vars/%s' % host_fqdn, 'r') as f:
        host_vars = yaml.safe_load(f)

    for dom,nets in host_vars['mesh_gw_prefixes'].items():
        networks.append({'gate': host,
                         'dom': dom,
                         'ipv4': nets['ipv4_dhcp'],
                         'ipv6': nets['ipv6_public'][0]})

wiki_table = wiki_tmpl.render(networks=networks)
print(wiki_table)
