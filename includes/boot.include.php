<?php
session_start();
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(E_ALL & ~E_NOTICE);

require_once(__DIR__.'/config.include.php');
require_once(__DIR__.'/db.include.php');
require_once(__DIR__.'/../vendor/smarty/Smarty.class.php');
require_once(__DIR__.'/../vendor/logger/main/php/Logger.php');
require_once(__DIR__.'/autoloader.include.php');

Logger::configure(array(
    'appenders' => array(
        'default' => array(
            'class' => 'LoggerAppenderPDO',
            'params' => array(
                'dsn' => 'mysql:host=localhost;dbname=s199879_tbs',
                'user' => 's199879_tbs',
                'password' => 's%23mJUh!h$8',
                'table' => 'audit_log',
            ),
        ),
    ),
    'rootLogger' => array(
        'appenders' => array('default'),
    ),
));
$user_log = Logger::getLogger('User ID '.$_SESSION['user_data']['user_id']);

$smarty = new Smarty;
$smarty->setTemplateDir(__DIR__.'/../views')
       ->setPluginsDir(array(__DIR__.'/../vendor/smarty/plugins'))
       ->setCompileDir(__DIR__.'/../vendor/smarty/templates_c')
       ->setCacheDir(__DIR__.'/../vendor/smarty/cache');

if($_SESSION['user_data']) {
  $smarty->assign('user_data', $_SESSION['user_data']);
}

?>
