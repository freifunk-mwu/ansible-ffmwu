# Ansible Role: Etherpad Nginx Config

Ansible role that installs and configures Nginx for Etherpad.


## Requirements & Dependencies
- service-nginx
- systemli.etherpad


## Variables

```yaml
etherpad_service_name: www.example.com (required)
nginx_ssl_directory: /etc/nginx/ssl/freifunk-mwu.de/ (required)
```
