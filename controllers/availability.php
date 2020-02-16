<?php

$Availability = new availability($Conn);
$Car = new Car($Conn);

$start = date('Y-m-d H:i', strtotime('midnight'));
$end = date('Y-m-d H:i', strtotime('+ 7 months midnight'));
$availability = array();

$cars = $Car->allCars();
foreach ($cars as $car){
    $car['availability'] = $Availability->getCarBookings($start, $end, $car['car_id']);
    $availability[] = $car;
}

$smarty->assign('availability_data', $availability);

