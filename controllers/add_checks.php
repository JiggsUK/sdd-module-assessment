<?php

$Checks = new checks($Conn);

$check_types = $Checks->getCheckTypes();
$smarty->assign('check_details', $check_types);

if ($_POST) {
    $Booking = new booking($Conn);
    $Booking->addMileageAndFuel($_POST['pickup_mileage'], $_POST['drop_off_mileage'], ($_POST['fuel'] / 100), $_GET['id']);

    $total_checks = count($_POST) - 4;
    if($total_checks > 4){
        for ($j = 1; $j <= 14; $j++) {
            $Checks->addChecks($_GET['id'], $j, $_POST['check_date'], $_POST[$j]);
        }
        header("Location: ./index.php?p=success_result");
    }
    $user_log->info($total_checks." car checks for booking ".$_GET['id']." added");
}




