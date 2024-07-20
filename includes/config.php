
<?php 
// Database credentials
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'carrental';

try {
    // Establish database connection
    $dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
} catch (PDOException $e) {
    // Handle connection error
    exit("Error: " . $e->getMessage());
}
?>
