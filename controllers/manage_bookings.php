<?php

$Bookings = new booking($Conn);

$bookings = $Bookings->allBookings();
$smarty->assign('bookings', $bookings);

