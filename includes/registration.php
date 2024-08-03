<?php
session_start();
include ("config.php");
//error_reporting(0);
if(isset($_POST['signup']))
{
    $fname=$_POST['fullname'];
    $email=$_POST['emailid']; 
    $mobile=$_POST['mobileno'];
    $password=md5($_POST['password']); 
    $sql="INSERT INTO  tblusers(FullName,EmailId,ContactNo,Password) VALUES(:fname,:email,:mobile,:password)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':fname',$fname,PDO::PARAM_STR);
    $query->bindParam(':email',$email,PDO::PARAM_STR);
    $query->bindParam(':mobile',$mobile,PDO::PARAM_STR);
    $query->bindParam(':password',$password,PDO::PARAM_STR);
    $query->execute();
    $lastInsertId = $dbh->lastInsertId();
    if($lastInsertId)
    {
        echo "<script>alert('Registration successful. Now you can login');</script>";
    }
    else 
    {
        echo "<script>alert('Something went wrong. Please try again');</script>";
    }
}
?>

<script>
function checkAvailability() {
    $("#loaderIcon").show();
    jQuery.ajax({
        url: "check_availability.php",
        data: 'emailid=' + $("#emailid").val(),
        type: "POST",
        success: function(data) {
            $("#user-availability-status").html(data);
            $("#loaderIcon").hide();
        },
        error: function () {}
    });
}

function valid() {
    var password = document.signup.password.value;
    var confirmPassword = document.signup.confirmpassword.value;
    var fullname = document.signup.fullname.value;
    var mobile = document.signup.mobileno.value;

    if (password != confirmPassword) {
        alert("Password and Confirm Password Field do not match!");
        document.signup.confirmpassword.focus();
        return false;
    }

    if (fullname.length < 8 || fullname.length > 20) {
        alert("Username must be between 8 and 20 characters!");
        document.signup.fullname.focus();
        return false;
    }

    var phonePattern = /^\d{10}$/;
    if (!phonePattern.test(mobile)) {
        alert("Phone number must be exactly 10 digits!");
        document.signup.mobileno.focus();
        return false;
    }

    return true;
}
</script>

<div class="modal fade" id="signupform">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title">Sign Up</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="signup_wrap">
            <div class="col-md-12 col-sm-6">
              <form method="post" name="signup" onSubmit="return valid();">
                <div class="form-group">
                  <input type="text" class="form-control" name="fullname" placeholder="Full Name" required="required" minlength="8" maxlength="20">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="mobileno" placeholder="Mobile Number" required="required" pattern="\d{10}">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="emailid" id="emailid" onBlur="checkAvailability()" placeholder="Email Address" required="required">
                  <span id="user-availability-status" style="font-size:12px;"></span> 
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm Password" required="required">
                </div>
                <div class="form-group checkbox">
                  <input type="checkbox" id="terms_agree" required="required" checked="">
                  <label for="terms_agree">I Agree with <a href="#">Terms and Conditions</a></label>
                </div>
                <div class="form-group">
                  <input type="submit" value="Sign Up" name="signup" id="submit" class="btn btn-block">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer text-center">
        <p>Already got an account? <a href="#loginform" data-toggle="modal" data-dismiss="modal">Login Here</a></p>
      </div>
    </div>
  </div>
</div>
