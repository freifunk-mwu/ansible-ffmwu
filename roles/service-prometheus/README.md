
# Ansible role service-prometheus

Prometheus ansible role based on **[williamyeh.prometheus](https://galaxy.ansible.com/williamyeh/prometheus/)**

This Ansible role has the following features for [Prometheus](http://prometheus.io/):

 - Install specific versions of [Prometheus server](https://github.com/prometheus/prometheus), [Node exporter](https://github.com/prometheus/node_exporter), [Blackbox exporter](https://github.com/prometheus/blackbox_exporter), [Alertmanager](https://github.com/prometheus/alertmanager).
 - Handlers for restart/reload/stop events;
 - Bare bone configuration (*real* configuration should be left to user's template files; see **Usage** section below).

## License

MIT License. See the [LICENSE file](LICENSE) for details.
