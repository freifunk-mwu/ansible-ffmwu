
# Ansible Role: Allow Powerdns api access

Adds reverse Proxy directive to allow api access to powerdns. Allows limit accessing IP.

## Requirements

none

## Role Variables

- `pdns_limit_api_access: x.x.x.x` (optional)

## Dependencies

- powerdns.pns
- service-nginx
