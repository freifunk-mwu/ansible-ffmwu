#!/usr/bin/env python3

import sys
import yaml

from netaddr import IPNetwork

# indentation workaround
# https://github.com/yaml/pyyaml/issues/234#issuecomment-765894586
class Dumper(yaml.Dumper):
    def increase_indent(self, flow=False, *args, **kwargs):
        return super().increase_indent(flow=flow, indentless=False)


if len(sys.argv) > 1:
    new_host = sys.argv[1]
else:
    print('usage: %s <new hostname>' % sys.argv[0])
    exit(1)

net_ranges = [IPNetwork('10.87.253.0/24'), IPNetwork('10.87.254.0/24')]
ports = list(range(50000, 50256))
host_groups = ['gateways', 'services', 'monitoring']

nets = []
for range in net_ranges:
    nets += list(range.subnet(31))

with open('inventory/group_vars/all', 'r') as f:
    group_vars = yaml.safe_load(f)

for net in group_vars['wireguard_networks']:
    nets.remove(IPNetwork(net['ipv4']))
    ports.remove(net['port'])

hosts = []
for group in host_groups:
    with open('inventory/%s' % group, 'r') as f:
        host_group = f.read().splitlines()

    host_group.remove('[%s]' % group)
    host_group = filter(None, host_group)
    hosts += host_group

hosts = [host.split('.')[0] for host in hosts]

wg_nets = []
for host in hosts:
    if host == new_host:
        continue

    net = {
        'ipv4': str(nets.pop(1)),
        'peers': [new_host, host],
        'port': ports.pop(1)}
    wg_nets.append(net)

print(yaml.dump({'wireguard_networks': wg_nets}, Dumper=Dumper))
