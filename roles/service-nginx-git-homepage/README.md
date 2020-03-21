# Ansible role service-nginx-git-homepage

Diese Ansible Rolle lädt homepages von git repos in einen pfad und erstellt einen passenden vhost für nginx. Desweiteren wir ein cronjob eingerichtet der diese homepage jede Stunde aktualisiert.

## Variablen

- Variable `git homepages` liste von homepages, format siehe Beispiele.

## Beispiele

git_homepages:
- mainz:
  urls:
  - "www.freifunk-mainz.de"
  - "mainz.freifunk.net"
  path: "{{ www_path }}/freifunk-mainz/www"
  git_repo: "https://github.com/freifunk-mwu/homepage-ffmz.git"
- mwu:
  urls:
  - "www.freifunk-mwu.de"
  path: "{{ www_path }}/freifunk-mwu/www"
  git_repo: "https://github.com/freifunk-mwu/www.freifunk-mwu.de.git"
