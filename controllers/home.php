<?php

if (!isset($_SESSION["is_loggedin"]) || $_SESSION["is_loggedin"] !== true) {
    header("location: index.php?p=login");
    exit();
}

$smarty->assign('user_data', $_SESSION['user_data']);

$login_count = $_SESSION['user_data']['login_count'] + 1;
$_SESSION['user_data']['login_count'] = $login_count;

if ($login_count == 1){
    $user_log->info("User has logged in");
}



