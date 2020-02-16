<?php


class booking
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    public function createBooking($car_id, $user_id, $pickup, $drop_off, $passengers, $purpose, $destination)
    {
        $query = "INSERT INTO booking(booked_by, car_id, main_driver, date_time_from, date_time_to, num_passengers, travel_purpose, destination)
        VALUES (:booked_by, :car_id, :main_driver, :date_time_from, :date_time_to, :num_passengers, :travel_purpose, :destination)";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(
            'booked_by' => $user_id,
            'car_id' => $car_id,
            'main_driver' => $user_id,
            'date_time_from' => $pickup,
            'date_time_to' => $drop_off,
            'num_passengers' => $passengers,
            'travel_purpose' => $purpose,
            'destination' => $destination
        ));
        return $this->Conn->lastInsertId();
    }

    public function getPreviousBookings($user_id)
    {
        $query = "SELECT booking.booking_id, manufacturer.manufacturer, model.model, DATE_FORMAT(booking.date_time_from, '%D %M %Y') AS booking_date, 
        DATE_FORMAT(booking.date_time_from, '%H:%i') AS time_from, DATE_FORMAT(booking.date_time_to, '%H:%i') AS time_to, booking.num_passengers, 
        booking.travel_purpose, booking.destination, booking.created_on, booking.last_update
        FROM booking, car, manufacturer, model 
        WHERE booking.booked_by = :user_id
        AND booking.car_id = car.car_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND booking.date_time_from < CURDATE()
        ORDER BY booking.date_time_from DESC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':user_id' => $user_id));
        $search_result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($search_result) {
            return $search_result;
        }
    }

    public function getFutureBookings($user_id)
    {
        $query = "SELECT booking.booking_id, manufacturer.manufacturer, model.model, DATE_FORMAT(booking.date_time_from, '%D %M %Y') AS booking_date, 
        DATE_FORMAT(booking.date_time_from, '%H:%i') AS time_from, DATE_FORMAT(booking.date_time_to, '%H:%i') AS time_to, booking.num_passengers, 
        booking.travel_purpose, booking.destination, booking.created_on, booking.last_update
        FROM booking, car, manufacturer, model 
        WHERE booking.booked_by = :user_id
        AND booking.car_id = car.car_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND booking.date_time_from >= CURDATE()
        ORDER BY booking.date_time_from DESC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':user_id' => $user_id));
        $search_result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($search_result) {
            return $search_result;
        }
    }

    public function addMileageAndFuel($pickup, $dropoff, $fuel, $booking_id)
    {
        $query = "UPDATE booking
        SET pick_up_mileage = :pickup, drop_off_mileage = :dropoff, fuel_level = :fuel
        WHERE booking.booking_id = :booking_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(
            ':pickup' => $pickup,
            ':dropoff' => $dropoff,
            ':fuel' => $fuel,
            ':booking_id' => $booking_id
        ));
        return true;
    }

    public function updateBooking($passengers, $purpose, $destination, $booking_id)
    {
        if ($passengers) {
            $query = "UPDATE booking
            SET num_passengers = :passengers
            WHERE booking.booking_id = :booking_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':passengers' => $passengers, ':booking_id' => $booking_id));
        }

        if ($purpose) {
            $query = "UPDATE booking
            SET travel_purpose = :purpose
            WHERE booking.booking_id = :booking_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':purpose' => $purpose, ':booking_id' => $booking_id));
        }

        if ($destination) {
            $query = "UPDATE booking
            SET destination = :destination
            WHERE booking.booking_id = :booking_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':destination' => $destination, ':booking_id' => $booking_id));
        }
        return true;
    }

    public function deleteBooking($booking_id)
    {
        $query = "DELETE FROM booking
            WHERE booking_id = :booking_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':booking_id' => $booking_id));
        return true;
    }

    public function allBookings()
    {
        $query = "SELECT booking.booking_id, user_data.first_name, user_data.last_name, manufacturer.manufacturer, model.model, DATE_FORMAT(booking.date_time_from, '%D %M %Y') AS booking_date, 
        DATE_FORMAT(booking.date_time_from, '%H:%i') AS time_from, DATE_FORMAT(booking.date_time_to, '%H:%i') AS time_to, booking.num_passengers, 
        booking.travel_purpose, booking.destination, booking.created_on, booking.last_update
        FROM booking, car, manufacturer, model, user_data 
        WHERE booking.booked_by = user_data.user_id
        AND booking.car_id = car.car_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND booking.date_time_from >= CURDATE()
        ORDER BY booking.date_time_from DESC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function allPrevBookings()
    {
        $query = "SELECT booking.booking_id, user_data.first_name, user_data.last_name, manufacturer.manufacturer, model.model, DATE_FORMAT(booking.date_time_from, '%D %M %Y') AS booking_date, 
        DATE_FORMAT(booking.date_time_from, '%H:%i') AS time_from, DATE_FORMAT(booking.date_time_to, '%H:%i') AS time_to, booking.num_passengers, 
        booking.travel_purpose, booking.destination, booking.created_on, booking.last_update
        FROM booking, car, manufacturer, model, user_data 
        WHERE booking.booked_by = user_data.user_id
        AND booking.car_id = car.car_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND booking.date_time_from < CURDATE()
        ORDER BY booking.date_time_from DESC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCarPreviousBookings($car_id)
    {
        $query = "SELECT booking.booking_id, user_data.first_name, user_data.last_name, manufacturer.manufacturer, model.model, DATE_FORMAT(booking.date_time_from, '%D %M %Y') AS booking_date, 
        DATE_FORMAT(booking.date_time_from, '%H:%i') AS time_from, DATE_FORMAT(booking.date_time_to, '%H:%i') AS time_to, booking.num_passengers, 
        booking.travel_purpose, booking.destination, booking.created_on, booking.last_update
        FROM booking, car, manufacturer, model, user_data 
        WHERE car.model = :car_id
        AND booking.booked_by = user_data.user_id
        AND booking.car_id = car.car_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND booking.date_time_from < CURDATE()
        ORDER BY booking.date_time_from DESC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':car_id' => $car_id));
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}