<?php
require_once('phppdf/vendor/autoload.php');
session_start();
error_reporting(0);
include('includes/config.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Your Company');
$pdf->SetTitle('Brands');
$pdf->SetSubject('Brands');
$pdf->SetKeywords('TCPDF, PDF, brands, guide');

// remove default header
$pdf->setPrintHeader(false);

// set footer fonts
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// add a page
$pdf->AddPage();

// set some text to print
$html = '
<h2>Brands</h2>
<table border="1" cellspacing="3" cellpadding="4">
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
        $html .= '
        <tr>
            <td>' . $cnt . '</td>
            <td>' . $result->BrandName . '</td>
            <td>' . $result->CreationDate . '</td>
            <td>' . $result->UpdationDate . '</td>
        </tr>';
        $cnt++;
    }
}

$html .= '
    </tbody>
</table>';

$pdf->writeHTML($html, true, false, true, false, '');

// Close and output PDF document
$pdf->Output('brands.pdf', 'D');
?>
