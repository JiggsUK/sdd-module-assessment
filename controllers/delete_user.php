<?php

$smarty->assign('user', $_GET['id']);

if ($_POST['confirm'] == 1) {
    $User = new User($Conn);
    $User->deleteUser($_GET['id']);
    header("Location: .\index.php?p=success_result");
    $user_log->info("User has deleted user ".$_GET['id']);
} else {
    header("Location: .\index.php?p=manage_users");
}





