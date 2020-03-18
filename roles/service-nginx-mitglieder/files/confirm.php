<?php
// Load and start smarty
require_once ('smarty3/Smarty.class.php');
$smarty = new Smarty;


if (file_exists ( './pending_members/'.$_GET['id'].".csv")){

  // move confirming user to new_members folder, ensure permissions
  rename('./pending_members/'.$_GET['id'].".csv",'./new_members/'.$_GET['id'].".csv");
  chmod('./new_members/'.$_GET['id'].".csv",0660);
  $message="Deine Mitgliedschaftsantrag wurde bestätigt. Wir bearbeiten diesen so schnell wie möglich...";

  /*load member data*/
  $tmp=file('./new_members/'.$_GET['id'].".csv");
  $member_data=str_getcsv($tmp[1], ';');
  unset($tmp);

  /* Send mail to vorstand@*/
  require_once('Mail.php');

  $headers['From']    = 'vorstand@freifunk-mainz.de';
  $headers['To']      = 'vorstand@freifunk-mainz.de';
  $headers['Content-type']  = 'text/plain; charset=utf-8';
  $headers['Subject'] = '=?UTF-8?B?'.base64_encode('Ein neues Mitglied möchte zum '.$member_data[22]." aufgenommen werden").'?=';

  $url="https://".$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"];
  $url=substr($url, 0, strrpos($url, '/') + 1);

  $mail_object =& Mail::factory('mail', '');
  $mail_object->send('vorstand@freifunk-mainz.de', $headers, "Name: ".$member_data[5]." ".$member_data[4]."\nDaten: ".$url.'new_members/');

}
elseif (file_exists ( './new_members/'.$_GET['id'].".csv")){
  $message="Deine Mitgliedschaftsantrag ist bereits bei uns eingetroffen. Bitte gib uns noch etwas Zeit den Antrag zu bearbeiten.";
}
else{
  $message="Entweder du hast eine falsche Id angegeben, oder dein Antrag wurde bereits bearbeitet, du hast aber noch keine willkommens Email erhalten.";
}

// Render Template for answer
$smarty->assign('message', $message);
$smarty->display('confirm.tpl');

?>
