<?php

if ($_POST['confirm'] == 2) {
    $Booking = new booking($Conn);
    $Booking->deleteBooking($_GET['id']);
    $user_log->info("User has cancelled booking ID ".$_GET['id']);
    header("Location: ./index.php?p=success_result");
} elseif ($_POST['confirm'] == 1) {
    header("Location: ./index.php?p=my_bookings");
}




