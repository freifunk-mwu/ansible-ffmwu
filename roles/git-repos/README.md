# Ansible role git-repos

Diese Ansible role klont wichtige git Repositories.

- installiert git
- legt /home/admin/clones an
- klont alle git Repositories aus dem Dictionary `common_repos`

## Benötigte Variablen

- Dictionary `common_repos` # role variable
```
common_repos:
  name: # name des Repositories == Ordner Name
    repo_url: # HTTP-URL zum Repository
    version: # Branch/Tag/Commit
    force: # Update erzwingen
...

```
