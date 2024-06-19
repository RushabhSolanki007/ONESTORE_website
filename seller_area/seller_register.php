<?php 

    include("includes/db.php");
    include("functions/functions.php");

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
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
   
   <div class="container"><!-- container begin -->
       <form action="" class="form-login" method="post" enctype="multipart/form-data"><!-- form-login begin -->
           <h2 class="form-login-heading"> Seller Register </h2>
           
           <input type="text" class="form-control" placeholder="Seller name" name="seller_name" required>

           <input type="text" class="form-control" placeholder="Shop name" name="seller_shop_name" required>
           
           <input type="email" class="form-control" placeholder="E-mail" name="seller_email" required>
           
           <input type="password" class="form-control" placeholder="Your Password" name="seller_pass" required>
           
           <input type="text" class="form-control" placeholder="Country" name="seller_country" required>
           
           <input type="tel" class="form-control" placeholder="Contact" name="seller_contact" pattern="^\d{3}\d{3}\d{4}$" required>
           
           <label class="col-md-3 control-label"> <h5>Image</h5> </label>
           <input name="seller_image" type="file" class="form-control" required>
           
           <input type="text" class="form-control" placeholder="About" name="seller_about" required>
           
           <input type="text" class="form-control" placeholder="Address" name="seller_address" required>

           <input type="text" class="form-control" placeholder="Shop Address" name="seller_shop_address" required>
           
           <button type="submit" class="btn btn-lg btn-primary btn-block" name="seller_register"><!-- btn btn-lg btn-primary btn-block begin -->
               
               Register
               
           </button><!-- btn btn-lg btn-primary btn-block finish -->
           
       </form><!-- form-login finish -->

   </div><!-- container finish -->
    
</body>
</html>


<?php 

    if(isset($_POST['seller_register'])){
        
        $seller_name = $_POST['seller_name'];
        $seller_shop_name = $_POST['seller_shop_name'];
        $seller_email = $_POST['seller_email'];
        $seller_pass = $_POST['seller_pass'];
        $seller_country = $_POST['seller_country'];
        $seller_about = $_POST['seller_about'];
        $seller_contact = $_POST['seller_contact'];
        $seller_address = $_POST['seller_address'];
        $seller_shop_address = $_POST['seller_shop_address'];
        $seller_ip = getRealIpUser();

        // $seller_image = $_FILES['seller_image']['name'];
        // $temp_seller_image = $_FILES['seller_image']['tmp_name'];
    
        // move_uploaded_file($temp_seller_image,"seller_images/$seller_image");

        $user_image = $_FILES['seller_image']['name'];
        $temp_seller_image = $_FILES['seller_image']['tmp_name'];
    
        move_uploaded_file($temp_seller_image,"seller_images/$user_image");

        $insert_seller = "insert into sellers (seller_name,seller_shop_name,seller_email,seller_pass,seller_image,seller_country,seller_about,seller_contact,seller_address,seller_shop_address,seller_ip) values ('$seller_name','$seller_shop_name','$seller_email','$seller_pass','$user_image','$seller_country','$seller_about','$seller_contact','$seller_address','$seller_shop_address','$seller_ip')";

        $run_seller = mysqli_query($con,$insert_seller);

        if($run_seller)
        {
            echo "<script>alert('You have been Seller Registered Sucessfully')</script>";
            echo "<script>window.open('index.php?dashboard','_self')</script>";
        }
        
    }

?>