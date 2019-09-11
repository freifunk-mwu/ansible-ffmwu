<p align="center">
  <img width="150" height="150" src="https://upload.wikimedia.org/wikipedia/commons/9/98/WordPress_blue_logo.svg">
</p>

# Ansible Role: WordPress

Ansible role that installs and configures WordPress with Nginx.

Features include:
- Installation of any WordPress version to specified directory
- Configuration of `wp-config.php`
- Fetch random salts for wp-config.php (https://api.wordpress.org/secret-key/1.1/salt/)

## Requirements & Dependencies
- Ansible 1.4 or higher
- Curl

## Variables
Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
wp_version: latest
wp_install_dir: '/var/www/html'
wp_db_name: "{{ wp_mysql_db }}" (required)
wp_db_user: "{{ wp_mysql_user }}" (required)
wp_db_password: "{{ wp_mysql_password }}" (required)
wp_db_host: 'localhost'
wp_db_charset: 'utf8mb4'
wp_db_collate: 'utf8mb4_unicode_ci'
wp_table_prefix: 'wp_'
wp_debug: false
wp_admin_email: 'admin@example.com'
site_name: "{{ wp_sitename }}" (requires)
```
