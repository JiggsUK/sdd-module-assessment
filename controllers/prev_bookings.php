<?php

$Car = new Car($Conn);
$make_and_model = $Car->fleetMakeAndModels();
$smarty->assign('make_and_model', $make_and_model);

$Booking = new booking($Conn);
$allBookings = $Booking->allPrevBookings();
$smarty->assign('bookings', $allBookings);

if ($_POST) {
    $filter = $Booking->getCarPreviousBookings($_POST['make']);
    $smarty->assign('bookings', $filter);
} else {
    $allBookings = $Booking->allPrevBookings();
    $smarty->assign('bookings', $allBookings);
}