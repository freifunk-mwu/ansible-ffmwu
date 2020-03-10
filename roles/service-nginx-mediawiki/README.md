# Ansible role service-nginx-mediawiki

Diese Ansible role installert mediawiki und konfiguriert den nginx vHost.

- schreibt mediawiki.conf
- legt mediawiki Verzeichnis

## Benötigte Variablen

- Variable `mediawiki_name` Wikiname
- Variable `mediawiki_namespace` Wikinamespace
- Variable `mediawiki_logo` Logo Dateiname
- Variable `mediawiki_contact` Kontaktadresse
- Variable `mediawiki_sender` Absenderadresse
- Variable `mediawiki_mysql_server` MySQL Server
- Variable `mediawiki_mysql_db` MySQL Datenbank
- Variable `mediawiki_mysql_user` MySQL User
- Variable `mediawiki_src` (Rollen Variable)
- Variable `mediawiki_path` (Rollen Variable)
- Variable `mediawiki_version` (Rollen Variable)
- Variable `mediawiki_version_major` Hauptversion
- Variable `mediawiki_version_minor` Bugfixversion
- Variable `http_mediawiki_external` (Rollen Variable)
- Variable `http_mediawiki_internal` (Rollen Variable)
- Variable `http_mediawiki_prefix` # string: Subdomain
- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
- Variable `www_path` # string: WWW Pfad
- Liste `mediawiki_extensions`
