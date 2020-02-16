<?php

$Car = new Car($Conn);

$cars = $Car->allCars();
$smarty->assign('all_cars', $cars);

$expired_cars = $Car->leaseExpiredCars();
$smarty->assign('expired_cars', $expired_cars);