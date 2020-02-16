<?php


class checks
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    public function getCheckTypes()
    {
        $query = "SELECT * FROM check_type";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addChecks($booking_id, $check_id, $check_date, $check_passed)
    {
        $query = "INSERT INTO car_check_record(booking_id, check_type_id, check_date, check_passed)
        VALUES (:booking_id, :check_type_id, :check_date, :check_passed)";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(
            ':booking_id' => $booking_id,
            ':check_type_id' => $check_id,
            ':check_date' => $check_date,
            ':check_passed' => $check_passed
        ));
        return true;
    }

}