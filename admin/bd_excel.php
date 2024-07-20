<?php
session_start();
error_reporting(0);
include('includes/config.php');

header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=brands.xls");

echo '<table border="1">
    <thead>
        <tr>
            <th>#</th>
            <th>Brand Name</th>
            <th>Creation Date</th>
            <th>Updation Date</th>
        </tr>
    </thead>
    <tbody>';

$sql = "SELECT * FROM tblbrands";
$query = $dbh->prepare($sql);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);
$cnt = 1;

if ($query->rowCount() > 0) {
    foreach ($results as $result) {
        echo '
        <tr>
            <td>' . $cnt . '</td>
            <td>' . $result->BrandName . '</td>
            <td>' . $result->CreationDate . '</td>
            <td>' . $result->UpdationDate . '</td>
        </tr>';
        $cnt++;
    }
}

echo '
    </tbody>
</table>';
?>
