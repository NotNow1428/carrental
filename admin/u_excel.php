<?php
session_start();
include('includes/config.php');
require 'phpspreadsheet/vendor/autoload.php'; // Include the PhpSpreadsheet library

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

if(strlen($_SESSION['alogin']) == 0) {	
    header('location:index.php');
} else {
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    // Set the title
    $sheet->setCellValue('A1', 'Registered Users');
    
    // Merge cells for the title
    $sheet->mergeCells('A1:I1');
    
    // Set the header
    $sheet->setCellValue('A2', '#');
    $sheet->setCellValue('B2', 'Name');
    $sheet->setCellValue('C2', 'Email');
    $sheet->setCellValue('D2', 'Contact no');
    $sheet->setCellValue('E2', 'DOB');
    $sheet->setCellValue('F2', 'Address');
    $sheet->setCellValue('G2', 'City');
    $sheet->setCellValue('H2', 'Country');
    $sheet->setCellValue('I2', 'Reg Date');

    // Fetch data from database
    $sql = "SELECT * FROM tblusers";
    $query = $dbh->prepare($sql);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    $row = 3; // Starting row for data (after the title and header)
    $cnt = 1;
    if ($query->rowCount() > 0) {
        foreach ($results as $result) {
            $sheet->setCellValue('A' . $row, $cnt);
            $sheet->setCellValue('B' . $row, htmlentities($result->FullName));
            $sheet->setCellValue('C' . $row, htmlentities($result->EmailId));
            $sheet->setCellValue('D' . $row, htmlentities($result->ContactNo));
            $sheet->setCellValue('E' . $row, htmlentities($result->dob));
            $sheet->setCellValue('F' . $row, htmlentities($result->Address));
            $sheet->setCellValue('G' . $row, htmlentities($result->City));
            $sheet->setCellValue('H' . $row, htmlentities($result->Country));
            $sheet->setCellValue('I' . $row, htmlentities($result->RegDate));
            $row++;
            $cnt++;
        }
    }

    $writer = new Xlsx($spreadsheet);
    $filename = 'registered_users.xlsx';

    // Set the correct headers to output an Excel file
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="'. $filename .'"'); 
    header('Cache-Control: max-age=0');
    
    // Save the file to PHP output stream
    $writer->save('php://output');
}
?>
