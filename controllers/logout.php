<?php
$_SESSION = array();
session_destroy();
$user_log->info("User has logged out");
header("Location: index.php?p=login");

