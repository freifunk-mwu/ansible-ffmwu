<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Freifunk Mainz e.V. &mdash; Beitrittsformular</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="Tritt dem Freifunk Mainz e.V. bei!">
<meta name="keywords" content="Freifunk, Mainz, e.V., Beitritt, Forumular, WLAN, Internetzugang, WiFi, Free, Wireless, Hotspot, Online">
<link rel="stylesheet" href="styles/style.css" type="text/css" />
</head>
<body>
<h1>Mitglied werden im Freifunk Mainz e.V.</h1></p>
<div id="Daten">
<form action="{$smarty.server.PHP_SELF}" method="post">
<fieldset><legend>Name</legend>
<p><label for="firstname" style="display: inline-block; width: 120px; {validate id='firstname' message="background-color : #FF0000 ;"}">Vorname:</label><input id="firstname" name="{$fields['firstname']}" type="text" value="{if isset($form)}{$form.firstname}{/if}" size="25" maxlength="35" accept-charset="UTF-8"></p>
<p><label for="lastname" style="display: inline-block; width: 120px; {validate id='lastname' message="background-color : #FF0000 ;"}">Nachname:</label><input id="lastname" name="{$fields['lastname']}" type="text" value="{if isset($form)}{$form.lastname}{/if}" size="25" maxlength="35" accept-charset="UTF-8"></p></fieldset>
<p></p><fieldset><legend>Adresse & Kontaktdaten</legend>
<p><label for="street" style="display: inline-block; width: 120px; {validate id='street' message="background-color : #FF0000 ;"}">Straße:</label><input id="street" name="{$fields['street']}" type="text" value="{if isset($form)}{$form.street}{/if}" size="25" maxlength="40" accept-charset="UTF-8"><p>
<p><label for="addr_extra" style="display: inline-block; width: 120px;">Adresszusatz:</label><input id="addr_extra" name="{$fields['addr_extra']}" type="text" value="{if isset($form)}{$form.addr_extra}{/if}" size="25" maxlength="40" accept-charset="UTF-8"> (optional)</p>
<p><label for="zip" style="display: inline-block; width: 120px; {validate id='zip' message="background-color : #FF0000 ;"}">PLZ:</label><input id="zip" name="{$fields['zip']}" type="text" value="{if isset($form)}{$form.zip}{/if}" size="5" maxlength="5" accept-charset="UTF-8" >
   <label for="city" style="display: inline-block; width: 80px; {validate id='city' message="background-color : #FF0000 ;"}">&nbsp;&nbsp;Stadt:</label><input id="city" name="{$fields['city']}" type="text" value="{if isset($form)}{$form.city}{/if}" size="20" maxlength="40" accept-charset="UTF-8"></p>
<p><label for="email" style="display: inline-block; width: 120px; {validate id='email' message="background-color : #FF0000 ;"}">E-Mail: </label><input id="email" name="{$fields['email']}" type="text" value="{if isset($form)}{$form.email}{/if}" size="20" maxlength="30" accept-charset="UTF-8"> </p>
<p><label for="nick" style="display: inline-block; width: 120px;">Nickname: </label><input id="nick" name="{$fields['nick']}" type="text" value="{if isset($form)}{$form.nick}{/if}" size="20" maxlength="20" accept-charset="UTF-8"> (optional)</p>
<p><label for="phone" style="display: inline-block; width: 120px;">Telefon:</label><input id="phone" name="{$fields['phone']}" type="text" value="{if isset($form)}{$form.phone}{/if}" size="20" maxlength="20" accept-charset="UTF-8"> (optional)</p>
<p><label for="pgpid" style="display: inline-block; width: 120px;">PGP Key ID:</label><input id="pgpid" name="{$fields['pgpid']}" type="text" value="{if isset($form)}{$form.pgpid}{/if}" size="20" maxlength="20" accept-charset="UTF-8"> (optional)</p></fieldset>
</p>
<div id="Mitgliedschaft"><fieldset><legend>Mitgliedschaft</legend>
<p><label for="monthpicker" style="display: inline-block; width: 160px; {validate id='entry_date' message="background-color : #FF0000 ;"}">Eintrittsmonat:</label><input name="{$fields['entry_date']}" type="date" value="{if isset($form)}{$form.entry_date}{else}{"next month"|date_format:"%Y-%m-01"}{/if}"></p>
<p><label style="display: inline-block; width: 160px; vertical-align:middle; {validate id='beitrag' message="background-color : #FF0000 ;"}">Gewünschter jährlicher Mitgliedsbeitrag:</label><input type="radio" name="{$fields['beitrag']}" value="12" {if $form.beitrag eq 12}{"checked"}{/if} >12 €<input type="radio" name="{$fields['beitrag']}" value="36" {if $form.beitrag eq 36}{"checked"}{/if}>36 €<input type="radio" name="{$fields['beitrag']}" value="72" {if $form.beitrag eq 72}{"checked"}{/if}>72 €</p>
<p>Im ersten Jahr wird ein voller Jahresbeitrag zum Eintrittsmonat abgebucht.</p>
</fieldset></div>
</p>
<div id="Kontoverbindung"><fieldset><legend>Kontoverbindung</legend>
<p>Ich ermächtige Freifunk Mainz e.V., Zahlungen von meinem, untenstehenden Konto mittels Lastschrift
einzuziehen. Zugleich weise ich hiermit mein Kreditinstitut an, von meinem Konto eingezogene
Lastschriften von Freifunk Mainz e.V, einzulösen. Hinweis: Ich kann innerhalb von acht Wochen,
beginnend mit dem Belastungsdatum, die Erstattung des belasteten Betrages verlangen. Es gelten
dabei die mit meinem Kreditinstitut vereinbarten Bedingungen. Das Mandat ist für wiederkehrende
Zahlungen. Der Einzugstermin ist der erste Werktag im Januar bzw. im Eintrittsjahr der 15. im
Eintrittsmonat. Die Mandatsreferenz entspricht der Mitgliedsnummer.</p>
<p>Gläubiger-Identifikationsnummer des Vereins: DE41MGB00001432794.</p>
<p><label for="account_owner" style="display: inline-block; width: 120px;">Kontoinhaber:</label><input id="account_owner" name="{$fields['account_owner']}" type="text" value="{if isset($form)}{$form.account_owner}{/if}" size="30" maxlength="40" accept-charset="UTF-8"> (falls abweichend von oben)</p>
<p><label for="iban" style="display: inline-block; width: 120px; {validate id='iban' message="background-color : #FF0000 ;"}">IBAN:</label><input id="iban" name="{$fields['iban']}" type="text" value="{if isset($form)}{$form.iban}{/if}" size="30" maxlength="40" accept-charset="UTF-8"></p>
<p><label for="bic" style="display: inline-block; width: 120px; {validate id='bic' message="background-color : #FF0000 ;"}">BIC:</label><input id="bic" name="{$fields['bic']}" type="text" value="{if isset($form)}{$form.bic}{/if}" size="30" maxlength="40" accept-charset="UTF-8"></fieldset></p>
<p><input name="{$fields['accept_satzung']}" type="checkbox" value="accepted" {if $form.accept_satzung eq "accepted"}{"checked"}{/if}><label style="{validate id='accept_satzung' message="background-color : #FF0000 ;"}"> Ich habe die <a href="https://wiki.freifunk-mwu.de/index.php/Verein/Satzung" target="_blank">Satzung</a> gelesen und akzeptiere diese. Ich stimme einer Abbuchung der Beiträge von dem oben angegebenen Konto zu.</label></p>
<input type="hidden" name="__A" value="{$enc_form}" />
<p><input type="submit" value="Mitglied werden"></p>
</form>
</div>
</body>
