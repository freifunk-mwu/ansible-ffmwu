#!/usr/bin/env python3

import sys
import yaml

from netaddr import IPNetwork
from pprint import pprint

# indentation workaround
# https://github.com/yaml/pyyaml/issues/234#issuecomment-765894586
class Dumper(yaml.Dumper):
    def increase_indent(self, flow=False, *args, **kwargs):
        return super().increase_indent(flow=flow, indentless=False)


if len(sys.argv) > 1:
    magic = int(sys.argv[1])
else:
    print('usage: %s <magic number>' % sys.argv[0])
    exit(1)

ipv4_ranges = {
    'dom0': IPNetwork('10.86.0.0/20'),
    'dom1': IPNetwork('10.86.16.0/20'),
    'dom2': IPNetwork('10.86.32.0/20'),
    'dom3': IPNetwork('10.86.48.0/20'),
    'dom4': IPNetwork('10.86.64.0/20'),
    'dom5': IPNetwork('10.86.80.0/20'),
    'dom6': IPNetwork('10.86.96.0/20'),
    'dom7': IPNetwork('10.86.112.0/20'),
}

legacy_ipv4_ranges = {
    'mz': IPNetwork('10.37.0.0/18'),
    'wi': IPNetwork('10.56.0.0/18'),
}

ipv6_range = IPNetwork('2a03:2260:11a:%02x00::/64' % magic)

legacy_ipv6_ranges = {
    'mz': IPNetwork('2a03:2260:11a:%02x00::/64' % magic),
    'wi': IPNetwork('2a03:2260:11b:%02x00::/64' % magic)
}

ipv4_subnet_size = 23
legacy_ipv4_subnet_size = 22

skip_ipv4_subnets = 1
legacy_ipv4_skip_subnets = 4

networks = {}
for dom, range in ipv4_ranges.items():
    networks[dom] = list(range.subnet(ipv4_subnet_size))
    networks[dom] = networks[dom][skip_ipv4_subnets:]

for dom, range in legacy_ipv4_ranges.items():
    networks[dom] = list(range.subnet(legacy_ipv4_subnet_size))
    networks[dom] = networks[dom][legacy_ipv4_skip_subnets:]

with open('inventory/gateways', 'r') as f:
    hosts = f.read().splitlines()

hosts.remove('[gateways]')
hosts = filter(None, hosts)

for host_fqdn in hosts:
    host = host_fqdn.split('.')[0]

    with open('inventory/host_vars/%s' % host_fqdn, 'r') as f:
        host_vars = yaml.safe_load(f)

    for dom, nets in host_vars['mesh_gw_prefixes'].items():
        networks[dom].remove(IPNetwork(nets['ipv4_dhcp']))

i = 0
client_networks = {}
for dom in ipv4_ranges.keys():
    num = i if i > 0 else 255
    ipv4 = networks[dom].pop(0)
    ipv6 = ipv6_range.next(num)
    client_networks[dom] = {'ipv4_dhcp': str(ipv4), 'ipv6_public': [str(ipv6)]}

    i += 1

for dom in legacy_ipv4_ranges.keys():
    ipv4 = networks[dom].pop(0)
    ipv6 = legacy_ipv6_ranges[dom]
    client_networks[dom] = {'ipv4_dhcp': str(ipv4), 'ipv6_public': [str(ipv6)]}

print(yaml.dump({'mesh_gw_prefixes': client_networks}, Dumper=Dumper))
