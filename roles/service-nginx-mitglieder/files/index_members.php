<?php
require_once ('smarty3/Smarty.class.php');

if (isset($_GET['delete'])){
    unlink($_GET['delete']);
}

$smarty = new Smarty;
$smarty->force_compile = true;

$members=[];
$member_files=glob('*.csv');

foreach ($member_files as $member_file) {
    $header=str_replace(';',',',file($member_file)[0]);
    $header='Löschen,'.$header;
    $members[]='<a href="index.php?delete='.$member_file.'" > X </a>';
    $members=array_merge($members,explode(';',file($member_file)[1]));
}

$smarty->assign('header', $header);
$smarty->assign('member_data', $members);
$smarty->display('../templates/members.tpl');

?>
