<?php

$User = new User($Conn);

if ($_POST) {
    $user_logon = $User->createUserLogon($_POST['email'], $_POST['password'], $_POST['user_type'] );
    $users = $User->createUser($user_logon, $_POST['employee_number'], $_POST['first_name'], $_POST['last_name'], $_POST['department'], $_POST['job'], $_POST['mobile'], $_POST['work_ext'], $_POST['email']);
    $user_log->info("User has created user ID" .$users);
    header("Location: ./index.php?p=success_result_admin");
}
