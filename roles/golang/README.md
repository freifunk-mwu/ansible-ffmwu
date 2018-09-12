# Ansible role golang

Diese Ansible role installiert den Go Compiler.

- installiert das Paket `golang-1.8`
- legt das Verzeichnis `$GOPATH` an
- legt /etc/profile.d/go.sh mit der Variable `$GOPATH` an

## Benötigte Variablen

- Variable `gopath`
