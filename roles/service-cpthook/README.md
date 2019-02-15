# Ansible role service-cpthook

Diese Ansible role installiert CptHook.

- schreibt cpthook.yml
- schreibt cpthook.service
- kompiliert und installiert CptHook
- aktiviert die systemd unit `cpthook.service`

# Benötigte Variablen

- Variable `gopath`

- Variable `cpthook_path` (Rollen-Variable)
- Variable `cpthook_config` (Rollen-Variable)
- Variable `cpthook_src` (Rollen-Variable)
