<?php
require_once('includes/config.php'); // Ensure this file has database connection and necessary configurations

// Fetch data from database
$sql = "SELECT * FROM tblvehicles";
$query = $dbh->prepare($sql);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_ASSOC);

// Include PhpSpreadsheet library
require 'phpspreadsheet/vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

// Create new Spreadsheet object
$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('Your Name')
            ->setLastModifiedBy('Your Name')
            ->setTitle('Vehicle List')
            ->setSubject('Exported Vehicle List')
            ->setDescription('Vehicle list exported from database');

// Add data
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', 'ID')
      ->setCellValue('B1', 'Vehicle Title')
      ->setCellValue('C1', 'Brand')
      ->setCellValue('D1', 'Price Per Day')
      ->setCellValue('E1', 'Fuel Type')
      ->setCellValue('F1', 'Model Year');

$row = 2;
foreach ($results as $row_data) {
    $sheet->setCellValue('A' . $row, $row_data['id'])
          ->setCellValue('B' . $row, $row_data['VehiclesTitle'])
          ->setCellValue('C' . $row, $row_data['VehiclesBrand'])
          ->setCellValue('D' . $row, $row_data['PricePerDay'])
          ->setCellValue('E' . $row, $row_data['FuelType'])
          ->setCellValue('F' . $row, $row_data['ModelYear']);
    $row++;
}

// Rename worksheet
$sheet->setTitle('Vehicle List');

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$spreadsheet->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel2007 format)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="vehicle_list.xlsx"');
header('Cache-Control: max-age=0');

$writer = new Xlsx($spreadsheet);
$writer->save('php://output');
exit;
?>
