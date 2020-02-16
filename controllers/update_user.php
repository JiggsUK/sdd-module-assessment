<?php

$User = new User($Conn);
if ($_POST) {
    $user_id = $_GET['id'];
    $User->updateUser($user_id, $_POST['employee_number'], $_POST['first_name'], $_POST['last_name'], $_POST['department'], $_POST['job'], $_POST['mobile'], $_POST['work_ext'], $_POST['email'], $_POST['user_type']);
    $user_log->info("User has updated user ID " .$_GET['id']);
    header("Location: ./index.php?p=success_result_admin");
}
