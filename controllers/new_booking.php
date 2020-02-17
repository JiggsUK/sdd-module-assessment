<?php
/** @noinspection ALL */
$Booking = new booking($Conn);
if ($_POST){
    $pickupDate = date("Y-m-d H:i", strtotime($_POST['pickup']));
    $dropoffDate = date("Y-m-d H:i", strtotime($_POST['drop-off']));
    $currentDate = date("Y-m-d H:i", time());

    $minTime =  date("H:i", strtotime('9am'));
    $maxTime = date("H:i", strtotime('5pm'));

    if ($pickupDate < $currentDate) {
        $user_log->info("Booking Rejected: Pick Up date is not in the future.");
        $error = "Pick Up date should not be historical";
    } elseif ($dropoffDate < $pickupDate) {
        $user_log->info("Booking Rejected: Drop Off date is before pick up date.");
        $error = "Drop Off date should not be after Pick Up date";
    } elseif (date("Y-m-d", $pickupDate) != date("Y-m-d", $dropoffDate)){
        $user_log->info("Booking Rejected: Pick Up and Drop Off dates are different");
        $error = "You must pick up and drop off the car on the same day";
    } elseif (date("H:i", $pickupDate) < $minTime || date("H:i", $dropoffDate) > $maxTime) {
        $user_log->info("Booking Rejected: Pick Up and Drop Off times not within business hours");
        $error = "Cars may only be booked in business hours (9am to 5pm)";
    }

    if($error) {
        $smarty->assign('error', $error);
    } else {
        $booking_data = $Booking->createBooking($_GET['car_id'], $_SESSION['user_data']['user_id'], $_POST['pickup'], $_POST['drop-off'], $_POST['passengers'], $_POST['travelPurpose'], $_POST['destination']);
        if ($booking_data) {
            $user_log->info("User has created booking ID " . $booking_data);
        } else {
            $user_log->info("Failed to create booking");
        }

        header("Location: .\index.php?p=success_result");
    }

}




