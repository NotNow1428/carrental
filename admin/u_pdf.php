<?php
session_start();
include('includes/config.php');
require_once('phppdf/vendor/autoload.php'); // Include the TCPDF library

if(strlen($_SESSION['alogin']) == 0) {	
    header('location:index.php');
    exit; // Ensure no further processing
} else {
    // Create new PDF document
    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // Set document information
    $pdf->SetCreator(PDF_CREATOR);
    $pdf->SetAuthor('Your Name');
    $pdf->SetTitle('Registered Users');
    $pdf->SetSubject('Registered Users');
    $pdf->SetKeywords('TCPDF, PDF, example, test, guide');

    // Add a page
    $pdf->AddPage();

    // Set title
    $pdf->SetFont('helvetica', 'B', 20);
    $pdf->Cell(0, 15, 'Registered Users', 0, 1, 'C');

    // Set table header
    $pdf->SetFont('helvetica', '', 12);
    $html = '<table border="1" cellspacing="3" cellpadding="4">
    <tr>
        <th>#</th>
        <th>Name</th>
        <th>Email</th>
        <th>Contact no</th>
        <th>DOB</th>
        <th>Address</th>
        <th>City</th>
        <th>Country</th>
        <th>Reg Date</th>
    </tr>';

    // Fetch data from database
    $sql = "SELECT * FROM tblusers";
    $query = $dbh->prepare($sql);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    $cnt = 1;
    if ($query->rowCount() > 0) {
        foreach ($results as $result) {
            $html .= '<tr>
                <td>' . $cnt . '</td>
                <td>' . htmlentities($result->FullName) . '</td>
                <td>' . htmlentities($result->EmailId) . '</td>
                <td>' . htmlentities($result->ContactNo) . '</td>
                <td>' . htmlentities($result->dob) . '</td>
                <td>' . htmlentities($result->Address) . '</td>
                <td>' . htmlentities($result->City) . '</td>
                <td>' . htmlentities($result->Country) . '</td>
                <td>' . htmlentities($result->RegDate) . '</td>
            </tr>';
            $cnt++;
        }
    }
    $html .= '</table>';

    // Output the HTML content
    $pdf->writeHTML($html, true, false, true, false, '');

    // Close and output PDF document
    $pdf->Output('registered_users.pdf', 'I');
}
?>
