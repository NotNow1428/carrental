<?php 
session_start();
include('includes/config.php');
error_reporting(0);

?>

<!DOCTYPE HTML>
<html lang="en">

<head>

    <title>Car Rental Portal</title>
    <!--Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
    <link href="assets/css/slick.css" rel="stylesheet">
    <link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
</head>

<body>

    <!--Header-->
    <?php include('includes/header.php');?>
    <!-- /Header -->

    <!-- Banners -->
    <section id="banner" class="banner-section">
        <div class="container">
            <div class="div_zindex">
                <div class="row">
                    <div class="col-md-5 col-md-push-7">
                        <div class="banner_content">
                            <h1>&nbsp;</h1>
                            <p>&nbsp; </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /Banners -->


    <!-- Resent Cat-->
    <section class="section-padding gray-bg">
        <div class="container">
            <div class="section-header text-center">
                <h2>Find the Best <span>CarForYou</span></h2>
                <p>Our top-rated rental agency offers a diverse fleet of well-maintained vehicles, from compact cars to
                    spacious SUVs(Sport Utility Vehicles), all at competitive prices with flexible rental terms. Enjoy a
                    smooth and hassle-free travel experience with our easy booking process, exceptional customer
                    service, and comprehensive insurance options.</p>
            </div>
            <div class="row">

                <!-- Nav tabs -->
                <div class="recent-tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#resentnewcar" role="tab" data-toggle="tab">Our
                                Car</a></li>
                    </ul>
                </div>

                <!-- Recently Listed New Cars -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="resentnewcar">
                        <?php $sql = "SELECT tblvehicles.VehiclesTitle,tblbrands.BrandName,tblvehicles.PricePerDay,tblvehicles.FuelType,tblvehicles.ModelYear,tblvehicles.id,tblvehicles.SeatingCapacity,tblvehicles.VehiclesOverview,tblvehicles.Vimage1 from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand limit 9";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{  
?>

                        <div class="col-list-3">
                            <div class="recent-car-list">
                                <div class="car-info-box">
                                    <a href="vehical-details.php?vhid=<?php echo htmlentities($result->id);?>"><img
                                            src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage1);?>"
                                            class="img-responsive" alt="image"></a>
                                    <ul>
                                        <li><i class="fa fa-car"
                                                aria-hidden="true"></i><?php echo htmlentities($result->FuelType);?>
                                        </li>
                                        <li><i class="fa fa-calendar"
                                                aria-hidden="true"></i><?php echo htmlentities($result->ModelYear);?>
                                            Model</li>
                                        <li><i class="fa fa-user"
                                                aria-hidden="true"></i><?php echo htmlentities($result->SeatingCapacity);?>
                                            seats</li>
                                    </ul>
                                </div>
                                <div class="car-title-m">
                                    <h6><a href="vehical-details.php?vhid=<?php echo htmlentities($result->id);?>">
                                            <?php echo htmlentities($result->VehiclesTitle);?></a></h6>
                                    <span class="price">NPR <?php echo htmlentities($result->PricePerDay);?> /Day</span>
                                </div>
                                <div class="inventory_info_m">
                                    <p><?php echo substr($result->VehiclesOverview,0,70);?></p>
                                </div>
                            </div>
                        </div>
                        <?php }}?>

                    </div>
                </div>
            </div>
    </section>
    <!-- /Resent Cat -->

    <!-- Fun Facts-->
    <?php
$brand_query = $dbh->query("SELECT COUNT(*) FROM tblbrands");
$brand_count = $brand_query->fetchColumn();

// Query to count the number of registered users
$user_query = $dbh->query("SELECT COUNT(*) FROM tblusers");
$user_count = $user_query->fetchColumn();

// Query to count the number of vehicles
$vehicle_query = $dbh->query("SELECT COUNT(*) FROM tblvehicles");
$vehicle_count = $vehicle_query->fetchColumn();
?>

    <section class="fun-facts-section">
        <div class="container div_zindex">
            <div class="row fun-facts">

                <div class="col-lg-3 col-xs-6 col-sm-3">
                    <div class="fun-facts-m">
                        <div class="cell">
                            <h2><i class="fa fa-car" aria-hidden="true"></i><?php echo $brand_count; ?>+</h2>
                            <p>Total brand</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-xs-6 col-sm-3">
                    <div class="fun-facts-m">
                        <div class="cell">
                            <h2><i class="fa fa-user-circle-o" aria-hidden="true"></i><?php echo $user_count; ?>+</h2>
                            <p>Register users</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-xs-6 col-sm-3">
                    <div class="fun-facts-m">
                        <div class="cell">
                            <h2><i class="fa fa-car" aria-hidden="true"></i><?php echo $vehicle_count; ?>+</h2>
                            <p>Cars For Rent</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Dark Overlay-->
        <div class="dark-overlay"></div>
    </section>
    <!-- /Fun Facts-->


    <!--Testimonial -->
    <section class="section-padding testimonial-section parallex-bg">
        <div class="container div_zindex">
            <div class="section-header white-text text-center">
                <h2>Our Satisfied <span>Customers</span></h2>
            </div>
            <div class="row">
                <div id="testimonial-slider">
                    <?php 
$tid=1;
$sql = "SELECT tblfeedback.Feedback,tblusers.FullName from tblfeedback join tblusers on tblfeedback.UserEmail=tblusers.EmailId where tblfeedback.status=:tid limit 4";
$query = $dbh -> prepare($sql);
$query->bindParam(':tid',$tid, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{  ?>


                    <div class="testimonial-m">

                        <div class="testimonial-content">
                            <div class="testimonial-heading">
                                <h5><?php echo htmlentities($result->FullName);?></h5>
                                <p><?php echo htmlentities($result->Feedback);?></p>
                            </div>
                        </div>
                    </div>
                    <?php }} ?>



                </div>
            </div>
        </div>
        <!-- Dark Overlay-->
        <div class="dark-overlay"></div>
    </section>
    <!-- /Testimonial-->


    <!--Footer -->
    <?php include('includes/footer.php');?>
    <!-- /Footer-->

    <!--Login-Form -->
    <?php include('includes/login.php');?>
    <!--/Login-Form -->

    <!--Register-Form -->
    <?php include('includes/registration.php');?>

    <!--/Register-Form -->

    <!--Forgot-password-Form -->
    <?php include('includes/forgotpassword.php');?>
    <!--/Forgot-password-Form -->

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/interface.js"></script>
    <!--Switcher-->
    <script src="assets/switcher/js/switcher.js"></script>
    <!--bootstrap-slider-JS-->
    <script src="assets/js/bootstrap-slider.min.js"></script>
    <!--Slider-JS-->
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>

</body>

</html>