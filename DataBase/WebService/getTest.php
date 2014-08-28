<?php
class BobDemo
{
    const DB_HOST = 'localhost';
    const DB_NAME = 'SKY_VENDA';
    const DB_USER = 'root';
    const DB_PASSWORD = 'root';
 
    private $conn = null;
 
    /**
     * Open the database connection
     */
    public function __construct(){
        // open database connection
        $connectionString = sprintf("mysql:host=%s;dbname=%s;charset=utf8",
                BobDemo::DB_HOST,
                BobDemo::DB_NAME);
 
        try {
            $this->conn = new PDO($connectionString,
                    BobDemo::DB_USER,
                    BobDemo::DB_PASSWORD);
            //for prior PHP 5.3.6
            //$conn->exec("set names utf8");
 
        } catch (PDOException $pe) {
            die($pe->getMessage());
        }
    }
 
    /**
     * close the database connection
     */
    public function __destruct() {
        // close the database connection
        $this->conn = null;
    }
}

public function selectBlob($id) {
 
    $sql = "SELECT id,
            Question,
            Answer,
            Image,
        FROM Faq;
 
    $stmt = $this->conn->prepare($sql);
    $stmt->execute(array(":id" => $id));
    $stmt->bindColumn(1, $mime);
    $stmt->bindColumn(2, $data, PDO::PARAM_LOB);
 
    $stmt->fetch(PDO::FETCH_BOUND);
 
    return array("mime" => $mime,
             "data" => $data);
 
}