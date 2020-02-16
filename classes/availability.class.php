<?php


class availability
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    public function getCarBookings($start, $end, $car_id)
    {
        $query = "SELECT DATE_FORMAT(booking.date_time_from, '%D %M %Y') AS booking_date, DATE_FORMAT(booking.date_time_from, '%H:%i') AS time_from, DATE_FORMAT(booking.date_time_to, '%H:%i') AS time_to
        FROM car, booking
        WHERE car.car_id = :car_id
        AND booking.car_id = car.car_id 
        AND booking.date_time_from >= :start
        AND booking.date_time_from <= :finish";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':start' => $start, ':finish' => $end, ':car_id' => $car_id));
        $search_result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($search_result) {
            return $search_result;
        }
    }
}