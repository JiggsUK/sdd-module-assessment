<?php
$Booking = new booking($Conn);
if ($_POST){
    $booking_data = $Booking->createBooking($_GET['car_id'], $_SESSION['user_data']['user_id'], $_POST['pickup'], $_POST['drop-off'], $_POST['passengers'], $_POST['travelPurpose'], $_POST['destination']);
    if ($booking_data) {
        $user_log->info("User has created booking ID " . $booking_data);
    } else {
        $user_log->info("Failed to create booking");
    }

    header("Location: .\index.php?p=success_result");
}




