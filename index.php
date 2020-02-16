<?php
require_once(__DIR__ . '/includes/boot.include.php');

if ($_GET['p']) {
    $secure_pages = array('add_checks', 'admin', 'availability', 'cancel_booking', 'delete_car', 'delete_user',
        'logout', 'manage_bookings', 'manage_users', 'manage_cars','my_bookings', 'new_booking','new_car','new_user',
        'success_result','success_result_admin','update_booking','update_car','update_user', 'audit');
    if (in_array($_GET['p'], $secure_pages)) {
        if (!$_SESSION['is_loggedin']) {
            header("Location:index.php?p=login");
            exit();
        }
    }
    $secure_admin_pages = array('admin', 'delete_car', 'delete_user', 'manage_bookings', 'manage_users', 'manage_cars',
        'new_car','new_user', 'success_result_admin','update_car','update_user', 'audit');
    if (in_array($_GET['p'], $secure_admin_pages)) {
        if ($_SESSION['user_data']['user_type'] == 'AUTHORISED USER') {
            header("Location:index.php?p=permission_denied");
            exit();
        }
    }
    require_once('controllers/' . $_GET['p'] . '.php');
    $smarty->display('pages/' . $_GET['p'] . '.tpl');
} else {
    require_once('controllers/home.php');
    $smarty->display('pages/home.tpl');
}
?>
