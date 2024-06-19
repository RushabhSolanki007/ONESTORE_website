<?php 

    session_start();
    include("includes/db.php");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ONE STORE Seller Area</title>
    <link rel="stylesheet" href="css/bootstrap-337.min.css">
    <link rel="stylesheet" href="font-awsome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
   
   <div class="container"><!-- container begin -->
       <form action="" class="form-login" method="post"><!-- form-login begin -->
           <h2 class="form-login-heading"> Seller Login </h2>
           
           <input type="text" class="form-control" placeholder="Email Address" name="seller_email" required>
           
           <input type="password" class="form-control" placeholder="Your Password" name="seller_pass" required>

            <a href="http://localhost/one%20store/seller_area/seller_forget_password.php">
         
                <h4>Forget Password ??</h4>
         
            </a>
           
           <button type="submit" class="btn btn-lg btn-primary btn-block" name="seller_login"><!-- btn btn-lg btn-primary btn-block begin -->
               
               Login
               
           </button><!-- btn btn-lg btn-primary btn-block finish -->

           <center><!-- center Begin -->
      
            <a href="seller_register.php">
             
                <h4> Don't have account..? Register here </h4>
             
            </a> 
      
            </center><!-- center Finish -->
           
       </form><!-- form-login finish -->
   </div><!-- container finish -->
    
</body>
</html>


<?php 

    if(isset($_POST['seller_login'])){
        
        $seller_email = mysqli_real_escape_string($con,$_POST['seller_email']);
        
        $seller_pass = mysqli_real_escape_string($con,$_POST['seller_pass']);
        
        $get_seller = "select * from sellers where seller_email='$seller_email' AND seller_pass='$seller_pass'";
        
        $run_seller = mysqli_query($con,$get_seller);
        
        $count = mysqli_num_rows($run_seller);
        
        if($count==1){
            
            $_SESSION['seller_email']=$seller_email;
            
            echo "<script>alert('Logged in. Welcome Back')</script>";
            
            echo "<script>window.open('index.php?dashboard','_self')</script>";
            
        }else{
            
            echo "<script>alert('Email or Password is Wrong !')</script>";
            
        }
        
    }

?>