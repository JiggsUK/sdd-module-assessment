<?php

if ($_POST) {

    $Booking = new booking($Conn);
    $Booking->updateBooking($_POST['passengers'], $_POST['purpose'], $_POST['destination'], $_GET['id']);
    $user_log->info("User has updated booking ID " .$_GET['id']);
    header("Location: ./index.php?p=success_result");
}




