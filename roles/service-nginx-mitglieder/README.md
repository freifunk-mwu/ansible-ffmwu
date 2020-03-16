# Ansible role service-nginx-mitglieder

Diese Ansible Rolle installiert ein selbst geschriebenes php Tool für das Mitgliedsbeitrittsformular des Freifunk Mainz e.V. und konfiguriert den passenden nginx vHost. Diese Tool verwendet u.A.: Smarty Templates, SmartyValidate zur Form Validierung und einen Formular Obfuscator um Spam zu verhindern. Die Daten von nicht per Double-Opt-In (Email) verifizierten Beigetretenen werden nach 2 Tagen per cron gelöscht.


## Variablen

- Variable `mitglieder_path` Home dir des Tools
- Variable `mitglieder_url` Url unter der das Tool erreichbar sein soll
- Variable `mitglieder_vorstand_htaccess_password` Passwort für den basic auth gegen das Verzeichnis mit den bestätigten Neumitgliedern
- Variable `mitglieder_php_obfuscator_password` Passwort für den Formular Obfuscator (Rollen Variable, optional)
