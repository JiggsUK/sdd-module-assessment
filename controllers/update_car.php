<?php

$Car = new Car($Conn);
$make_and_model = $Car->allMakeAndModels();
$smarty->assign('make_and_model', $make_and_model);

$body_type = $Car->allBodyTypes();
$smarty->assign('body', $body_type);

$User = new User($Conn);
$owner = $User->allUsers();
$smarty->assign('owners', $owner);



if ($_POST) {
    $Car->updateCar($_GET['id'], $_POST['owner'], $_POST['make'], $_POST['reg_no'], $_POST['body_type'], $_POST['capacity'], $_POST['lease_start'], ($_POST['lease_end'] ? $_POST['lease_end']: null) );
    $user_log->info("User has updated car ID" .$_GET['id']);
    header("Location: ./index.php?p=success_result_admin");
}
