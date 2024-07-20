<?php
session_start();
include('includes/config.php');
if(strlen($_SESSION['login'])==0) { 
    header('location:index.php');
} else {
    if(isset($_GET['id'])) {
        $id = intval($_GET['id']);
        $sql = "DELETE FROM tblfeedback WHERE id=:id";
        $query = $dbh->prepare($sql);
        $query->bindParam(':id', $id, PDO::PARAM_STR);
        $query->execute();
        header('location:my-Feedback.php');
    }
}
?>
