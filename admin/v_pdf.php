<?php
require_once('includes/config.php'); // Ensure this file has database connection and necessary configurations

// Fetch data from database
$sql = "SELECT * FROM tblvehicles";
$query = $dbh->prepare($sql);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_ASSOC);

// Include libraries for PDF generation (e.g., TCPDF, FPDF, etc.)

// Example using TCPDF library
require_once('phppdf/vendor/autoload.php');

// Create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// Set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Your Name');
$pdf->SetTitle('Vehicle List');
$pdf->SetSubject('Exported Vehicle List');
$pdf->SetKeywords('TCPDF, PDF, export, vehicle');

// Disable default header
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

// Set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// Set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// Set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// Set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// Set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__) . '/lang/eng.php')) {
    require_once(dirname(__FILE__) . '/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// Add a page
$pdf->AddPage();

// Content
$html = '<h1>Vehicle List</h1>';
$html .= '<table border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th>#</th>
                <th>Vehicle Title</th>
                <th>Brand</th>
                <th>Price Per day</th>
                <th>Fuel Type</th>
                <th>Model Year</th>
            </tr>';
foreach ($results as $row) {
    $html .= '<tr>
                <td>' . $row['id'] . '</td>
                <td>' . $row['VehiclesTitle'] . '</td>
                <td>' . $row['VehiclesBrand'] . '</td>
                <td>' . $row['PricePerDay'] . '</td>
                <td>' . $row['FuelType'] . '</td>
                <td>' . $row['ModelYear'] . '</td>
            </tr>';
}
$html .= '</table>';

// Print content using the WriteHTML method
$pdf->writeHTML($html, true, false, true, false, '');

// Close and output PDF document
$pdf->Output('vehicle_list.pdf', 'D');
?>
