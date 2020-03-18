<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<body>
<div id="Message">
Hallo {if $form.nick eq ''}{$form.firstname}{else}{$form.nick}{/if},<br><br>

<p>danke dass du den Freifunk Mainz e.V. mit deiner Mitgliedschaft unterstützen möchtest.<br/>
Bestätige bitte unter:<br />
<a href="{$url}"> {$url}</a><br />
deinen Mitgliedsantrag (opt in).<p>

<p>Dein Beitritt wird vorraussichtlich zum {$form.entry_date} durch die Aufnahme durch den Vorstand wirksam.<br />
 Du erhälst zu diesem Vorgang eine eigene Email, der Beitrag für das laufende Jahr wird kurz darauf abgebucht.</p>

<p>Solltest nicht du selbst das Mitgliedsformular ausgefüllt haben, so brauchst du nichts weiter unternehmen.<br </>
Alle Daten, die eingegeben wurden, werden binnen 48h gelöscht, sofern sie nicht vorher bestätigt wurden.</p>


<br><br>Der Vorstand
</div>
</body>
