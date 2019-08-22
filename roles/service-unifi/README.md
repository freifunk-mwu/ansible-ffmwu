
# Ansible Role: UniFi controller

An Ansible role that installs UniFi Controller (Ubiquiti Networks) on Debian like systems. Also configures reuqired nginx vhost.

## Requirements

none

## Role Variables

- `unifi_controller_jvm_xmx: 1024M`
- `unifi_user: unifi`

## Dependencies

- lean_delivery.java
- service-nginx

## Example Playbook

    - hosts: gw
      roles:
        - { role: service-unifi }
