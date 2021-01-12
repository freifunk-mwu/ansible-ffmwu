# Ansible role git-repos

Diese Ansible role klont wichtige git Repositories.

- installiert git
- legt /home/admin/clones an
- klont alle git Repositories aus den Dictionaries `common_repos` und `additional_repos`

## Benötigte Variablen

- Dictionary `common_repos` # role variable
```
common_repos:
  name: # name des Repositories == Ordner Name
    repo_url: # HTTP-URL zum Repository
    version: # Branch/Tag/Commit (Default: HEAD)
    pull: # Update (Default: yes)
    force: # Update erzwingen (Default: no)
  ...
```
- Dictionary `additional_repos` # role variable (optional)
```
additional_repos:
  name: # name des Repositories == Ordner Name
    repo_url: # HTTP-URL zum Repository
    version: # Branch/Tag/Commit (Default: HEAD)
    pull: # Update (Default: yes)
    force: # Update erzwingen (Default: no)
  ...
```
