<?php

class Car
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    public function createCar($owner, $model, $reg_number, $body_type, $passenger_capacity, $lease_start_date, $lease_end_date)
    {
        $query = "INSERT INTO car(owner, model, reg_number, body_type, passenger_capacity, lease_start_date, lease_end_date) 
        VALUES (:owner, :model, :reg_number, :body_type, :passenger_capacity, :lease_start_date, :lease_end_date)";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(
            ':owner' => $owner,
            ':model' => $model,
            ':reg_number' => $reg_number,
            ':body_type' => $body_type,
            ':passenger_capacity' => $passenger_capacity,
            ':lease_start_date' => $lease_start_date,
            ':lease_end_date' => $lease_end_date
        ));
        return $this->Conn->lastInsertId();
    }

    public function allCars()
    {
        $query = "SELECT car.car_id, CONCAT_WS(' ', user_data.first_name, user_data.last_name) AS name, manufacturer.manufacturer, model.model, 
        car.reg_number, body_type.body_type, car.passenger_capacity, 
        DATE_FORMAT(car.lease_start_date, '%d-%m-%Y') AS lease_start_date, 
        DATE_FORMAT(car.lease_end_date, '%d-%m-%Y') AS lease_end_date, 
        DATE_FORMAT(car.last_update, '%d-%m-%Y %H:%i') AS last_update
        FROM car, user_data, model, manufacturer, body_type
        WHERE car.owner = user_data.user_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND car.body_type = body_type.body_type_id
        AND car.lease_end_date IS NULL";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function leaseExpiredCars()
    {
        $query = "SELECT car.car_id, CONCAT_WS(' ', user_data.first_name, user_data.last_name) AS name, manufacturer.manufacturer, model.model, 
        car.reg_number, body_type.body_type, car.passenger_capacity, 
        DATE_FORMAT(car.lease_start_date, '%d-%m-%Y') AS lease_start_date, 
        DATE_FORMAT(car.lease_end_date, '%d-%m-%Y') AS lease_end_date, 
        DATE_FORMAT(car.last_update, '%d-%m-%Y %H:%i') AS last_update
        FROM car, user_data, model, manufacturer, body_type
        WHERE car.owner = user_data.user_id
        AND car.model = model.model_id
        AND model.manufacturer_id = manufacturer.manufacturer_id
        AND car.body_type = body_type.body_type_id
        AND car.lease_end_date IS NOT NULL";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function allMakeAndModels()
    {
        $query = "SELECT * FROM manufacturer, model
        WHERE model.manufacturer_id = manufacturer.manufacturer_id
        ORDER BY manufacturer.manufacturer, model.model ASC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function allBodyTypes()
    {
        $query = "SELECT * FROM body_type";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updateCar($car_id, $owner, $model, $reg_number, $body_type, $passenger_capacity, $lease_start_date, $lease_end_date)
    {
        if ($owner) {
            $query = "UPDATE car
            SET owner = :owner
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':owner' => $owner, ':car_id' => $car_id));
        }

        if ($model) {
            $query = "UPDATE car
            SET model = :model
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':model' => $model, ':car_id' => $car_id));
        }

        if ($reg_number) {
            $query = "UPDATE car
            SET reg_number = :reg_number
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':reg_number' => $reg_number, ':car_id' => $car_id));
        }

        if ($body_type) {
            $query = "UPDATE car
            SET body_type = :body_type 
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':body_type' => $body_type, ':car_id' => $car_id));
        }

        if ($passenger_capacity) {
            $query = "UPDATE car
            SET passenger_capacity = :passenger_capacity
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':passenger_capacity' => $passenger_capacity, ':car_id' => $car_id));
        }

        if ($lease_start_date) {
            $query = "UPDATE car
            SET lease_start_date = :lease_start_date
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':lease_start_date' => $lease_start_date, ':car_id' => $car_id));
        }

        if ($lease_end_date) {
            $query = "UPDATE car
            SET lease_end_date = :lease_end_date
            WHERE car.car_id = :car_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':lease_end_date' => $lease_end_date, ':car_id' => $car_id));
        }
    }

    public function fleetMakeAndModels()
    {
        $query = "SELECT model.model_id, manufacturer.manufacturer, model.model FROM manufacturer, model, car
        WHERE model.manufacturer_id = manufacturer.manufacturer_id
        AND car.model = model.model_id
        ORDER BY manufacturer.manufacturer, model.model ASC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function deleteCar($car_id)
    {
        $query = "UPDATE car
            SET lease_end_date = CURDATE()
            WHERE car.car_id = :car_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':car_id' => $car_id));
    }
}

?>
