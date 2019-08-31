
# Ansible Role: Allow Powerdns api access

Adds reverse Proxy directive to allow api access to powerdns. Allows limit accessing IP.

## Requirements

none

## Role Variables
Mandatory (If not defined access will be disallowed for everyone)

- pdns_limit_api_access:
    - x.x.x.x
    - y.y.y.y

## Dependencies

- powerdns.pns
- service-nginx
