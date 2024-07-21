<?php
session_start();
error_reporting(0);
include('includes/config.php');
header("Content-Type: application/xls");
header("Content-Disposition: attachment; filename=bookings.xls");
header("Pragma: no-cache");
header("Expires: 0");

$output = "";
$output .= "
<table border='1'>
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Vehicle</th>
            <th>From Date</th>
            <th>To Date</th>
            <th>Remark</th>
            <th>Status</th>
            <th>Posting date</th>
        </tr>
    </thead>
    <tbody>
";

$sql = "SELECT tblusers.FullName, tblbrands.BrandName, tblvehicles.VehiclesTitle, tblbooking.FromDate, tblbooking.ToDate, tblbooking.message, tblbooking.Status, tblbooking.PostingDate 
        FROM tblbooking 
        JOIN tblvehicles ON tblvehicles.id=tblbooking.VehicleId 
        JOIN tblusers ON tblusers.EmailId=tblbooking.userEmail 
        JOIN tblbrands ON tblvehicles.VehiclesBrand=tblbrands.id";

$query = $dbh->prepare($sql);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);
$cnt = 1;

if ($query->rowCount() > 0) {
    foreach ($results as $result) {
        $status = ($result->Status == 0) ? 'Not Confirmed yet' : (($result->Status == 1) ? 'Confirmed' : 'Cancelled');
        $output .= "
        <tr>
            <td>{$cnt}</td>
            <td>{$result->FullName}</td>
            <td>{$result->BrandName}, {$result->VehiclesTitle}</td>
            <td>{$result->FromDate}</td>
            <td>{$result->ToDate}</td>
            <td>{$result->message}</td>
            <td>{$status}</td>
            <td>{$result->PostingDate}</td>
        </tr>
        ";
        $cnt++;
    }
}

$output .= "
    </tbody>
</table>
";

echo $output;
?>
