<?php

class User
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    public function createUser($logon_id, $employee_number, $first_name, $last_name, $department, $job, $mobile, $work_ext, $email)
    {
        $query = "INSERT INTO user_data (logon_id, employee_number, first_name, last_name, department, job_title, mobile_number, email_address, work_ext) 
        VALUES (:logon, :employee_number, :first_name, :last_name, :department, :job_title, :mobile_number, :email_address, :work_ext)";
        $stmt = $this->Conn->prepare($query);
        return $stmt->execute(array(
            ':logon' => $logon_id,
            ':employee_number' => $employee_number,
            ':first_name' => $first_name,
            ':last_name' => $last_name,
            ':department' => $department,
            ':job_title' => $job,
            ':mobile_number' => $mobile,
            ':email_address' => $email,
            ':work_ext' => $work_ext
        ));
        return $this->Conn->lastInsertId();
    }

    public function createUserLogon($email, $password, $user_type)
    {
        $sec_password = password_hash($password, PASSWORD_DEFAULT);
        $query = "INSERT INTO user_logon (username, password, user_type) 
        VALUES (:username, :password, :user_type)";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(
            ':username' => $email,
            ':password' => $sec_password,
            ':user_type' => $user_type
        ));
        return $this->Conn->lastInsertId();
    }

    public function loginUser($username, $password)
    {
        $query = "SELECT user_data.user_id, user_logon.username, user_logon.password, user_logon.user_type  
        FROM user_logon, user_data 
        WHERE user_logon.username = :username
        AND user_logon.logon_id = user_data.logon_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':username' => $username));
        $attempt = $stmt->fetch();

        if ($attempt && password_verify($password, $attempt['password'])) {
            return $attempt;
        } else {
            return false;
        }
    }

    public function allUsers()
    {
        $query = "SELECT user_data.user_id, user_data.employee_number, CONCAT_WS(' ', user_data.first_name, user_data.last_name) AS name, 
        user_data.department, user_data.job_title, user_data.mobile_number, user_data.email_address, user_data.work_ext FROM user_data WHERE deleted = 0";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array());
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updateUser($user_id, $employee_number, $first_name, $last_name, $department, $job, $mobile, $work_ext, $email, $user_type)
    {
        if ($employee_number) {
            $query = "UPDATE user_data
            SET employee_number = :employee_number
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':employee_number' => $employee_number, ':user_id' => $user_id));
        }

        if ($first_name) {
            $query = "UPDATE user_data
            SET first_name = :first_name
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':first_name' => $first_name, ':user_id' => $user_id));
        }

        if ($last_name) {
            $query = "UPDATE user_data
            SET last_name = :last_name
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':last_name' => $last_name, ':user_id' => $user_id));
        }

        if ($department) {
            $query = "UPDATE user_data
            SET department = :department
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':department' => $department, ':user_id' => $user_id));
        }

        if ($job) {
            $query = "UPDATE user_data
            SET job_title = :job_title
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':job_title' => $job, ':user_id' => $user_id));
        }

        if ($mobile) {
            $query = "UPDATE user_data
            SET mobile_number = :mobile_number
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':mobile_number' => $mobile, ':user_id' => $user_id));
        }

        if ($work_ext) {
            $query = "UPDATE user_data
            SET work_ext = :work_ext
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':work_ext' => $work_ext, ':user_id' => $user_id));
        }

        if ($user_type) {
            $query = "UPDATE user_data
            SET user_type = :user_type
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':user_type' => $user_type, ':user_id' => $user_id));
        }

        if ($email) {

            $query = "UPDATE user_data
            SET email_address = :email_address
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':email_address' => $email, ':user_id' => $user_id));

            $logon_query = "SELECT user_data.logon_id FROM user_data
            WHERE user_data.user_id = :user_id";
            $stmt = $this->Conn->prepare($logon_query);
            $result = $stmt->execute(array(':user_id' => $user_id));
            $this->updateLogon($result, $email);
        }
    }

    private function updateLogon($logon_id, $email)
    {
        if ($email) {
            $query = "UPDATE user_logon
            SET username = :email_address
            WHERE logon_id = :logon_id";
            $stmt = $this->Conn->prepare($query);
            $stmt->execute(array(':email_address' => $email, ':logon_id' => $logon_id));
        }
    }

    public function deleteUser($user_id)
    {
        $query = "UPDATE user_data
            SET deleted = 1
            WHERE user_data.user_id = :user_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':user_id' => $user_id));
        return true;
    }
}

?>
