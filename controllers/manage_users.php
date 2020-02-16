<?php

$User = new User($Conn);

$users = $User->allUsers();
$smarty->assign('all_users', $users);