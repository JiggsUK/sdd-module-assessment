<?php

$audit = new audit($Conn);

$audit_trail = $audit->getAudit();
$smarty->assign('audit_data', $audit_trail);