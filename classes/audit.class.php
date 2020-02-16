<?php


class audit
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    public function getAudit()
    {
        $query = "SELECT DATE_FORMAT(timestamp, '%D %M %Y %H:%i') AS timestamp, logger, message
        FROM audit_log";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        $search_result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($search_result) {
            return $search_result;
        }
    }
}