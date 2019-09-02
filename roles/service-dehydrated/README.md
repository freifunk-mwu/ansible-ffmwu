# service-dehydrated

## based upon clutterbox.dehydrated (https://github.com/clutterbox/ansible-dehydrated) by Alexander Zielke

## Striped down for simplicity: removed http-01 challenge, hooks
## Added pdns_api.sh (https://github.com/silkeh/pdns_api.sh) for powerdns api handling

Install, configure and run dehydrated Let's Encrypt client

- [service-dehydrated](#clutterboxdehydrated)
  * [Role Variables](#role-variables)
  * [Using dns-01 challenges](#using-dns-01-challenges)
  * [using systemd timers](#using-systemd-timers)
  * [Overriding per certificate config](#overriding-per-certificate-config)
  * [dehydrated_deploycert](#dehydrated-deploycert)
    + [Variables](#variables)
  * [Example Playbooks](#example-playbooks)
    + [Using dns-01 with cloudflare](#using-dns-01-with-cloudflare)
    + [Using dehydrated_deploycert with multiple certificates](#using-dehydrated-deploycert-with-multiple-certificates)
  * [License](#license)
  * [Author Information](#author-information)



## Role Variables

Variable | Function | Default
--- | --- | ---
dehydrated_accept_letsencrypt_terms | Set to yes to automatically register and accept Let's Encrypt terms | no
dehydrated_contactemail | E-Mail address (required) |
dehydrated_domains | List of domains to request SSL certificates for |
dehydrated_deploycert | Script to run to deploy a certificate (see below) |
dehydrated_install_root | Where to install dehydrated | /opt/dehydrated
dehydrated_update | Update dehydrated sources on ansible run | yes
dehydrated_version | Which version to check out from github | HEAD
dehydrated_key_algo | Keytype to generate (rsa, prime256v1, secp384r1) | rsa
dehydrated_keysize | Size of Key (only for rsa Keys) | 4096
dehydrated_ca | CA to use | https://acme-v02.api.letsencrypt.org/directory
dehydrated_cronjob | Install cronjob for certificate renewals | yes
dehydrated_systemd_timer | Use systemd timer for certificate renewals | no
dehydrated_run_on_changes | If dehydrated should run if the list of domains changed | yes
dehydrated_systemd_timer_onfailure | If set, an OnFailure-Directive will be added to the systemd unit |
dehydrated_cert_config | Override configuration for certificates | []
dehydrated_repo_url | Specify URL to git repository of dehydrated | https://github.com/lukas2511/dehydrated.git
pdns_api_repo_url | Specify URL to git repository of pdns_api.sh | https://github.com/silkeh/pdns_api.sh
pdns_api_update | Update pdns_api.sh sources on ansible run | yes
pdns_api_version | Powerdns api version (v>4 ? 1 : 0) | 1

## Using dns-01 challenges

Due to simplicity only dns-01 is supported. See [Example Playbooks](#example-playbooks)

## using systemd timers

It is possible to use a systemd-timer instead of a cronjob to renew certificates.

**Note**: Enabling the systemd timer does *not* disable the cronjob. This might change in the future.

```yaml
dehydrated_systemd_timer: yes
dehydrated_cronjob: no
```

## Overriding per certificate config


The Configration for single certificates can be overridden using `dehydrated_cert_config`.

`dehydrated_cert_config` must be a list of dicts. Only the elemenent `name:` is mandatory ans must match a certificate name. The certificate name is either the first domain listed in domains.txt or the certificate alias, if defined.

Format is as follows:

```yaml
dehydrated_cert_config:
 - name: # certificate name or alias (mandatory)
   state: present # present or absent (optional)
   challengetype: # override CHALLENGE (optional)
   wellknown: # override WELLKNOWN (optional)
   key_algo: # override KEY_ALGO (optional)
   keysize: # override KEYSIZE (optional)
```

## dehydrated_deploycert

The variable dehydrated_deploycert contains a shellscript fragment to be executed when a certificate has successfully been optained. This variable can either be a multiline string or a hash of multiline strings.

```yaml
dehydrated_deploycert: |
  service nginx reload
```

In this example, for ever certificate obtained, nginx will be reloaded

```yaml
dehydrated_deploycert:
  example.com: |
    service nginx reload
  service.example.com: |
    cat ${FULLCHAINFILE} ${KEYFILE} > /etc/somewhere/ssl/full.pem
    service someservice reload
```

Here, for certificates with the primary domain example.com, nginx will be reloaded and for service.example.com the certificate, intermediate and key will be written to another file and someservice is reloaded.

### Variables

Variable | Function
--- | ---
DOMAIN | (Primary) Domain of the certificate
KEYFILE | Full path to the keyfile
CERTFILE | Full path to certificate file
FULLCHAINFILE | Full path to file containing both certificate and intermediate
CHAINFILE | Full path to intermediate certificate file
TIMESTAMP | Timestamp when the  certificate was created.

## Example Playbooks

### Using dns-01 with powerdns (only supported use case)
```yaml
- hosts: servers
  vars:
    dehydrated_accept_letsencrypt_terms: yes
    dehydrated_contactemail: hostmaster@example.com
    dehydrated_challengetype: dns-01
    dehydrated_domains: example.com
    pdns_host: https://powerdns-api.url.com:port

    dehydrated_deploycert: |
      service nginx reload
  roles:
    - service-dehydrated
```


# License

MIT License

# Author Information

Alexander Zielke - mail@alexander.zielke.name

Sebastian Schmachtel - prisma_freifunk@oimel.net
