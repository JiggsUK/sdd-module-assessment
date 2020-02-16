<?php

$smarty->assign('car', $_GET['id']);

if ($_POST['confirm'] == 1) {
    $Car = new Car($Conn);
    $Car->deleteCar($_GET['id']);
    header("Location: .\index.php?p=success_result");
    $user_log->info("User has deleted car ".$_GET['id']);
} else {
    header("Location: .\index.php?p=manage_cars");
}





