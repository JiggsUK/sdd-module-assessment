<?php
$Bookings = new booking($Conn);

$prev_bookings = $Bookings->getPreviousBookings($_SESSION['user_data']['user_id']);
$future_bookings = $Bookings->getFutureBookings($_SESSION['user_data']['user_id']);

$smarty->assign('prev_booking', $prev_bookings);
$smarty->assign('future_booking', $future_bookings);
