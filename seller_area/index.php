<?php 

    session_start();
    include("includes/db.php");
    
    if(!isset($_SESSION['seller_email'])){
        
        echo "<script>window.open('login.php','_self')</script>";
        
    }else{

        $seller_session = $_SESSION['seller_email'];
        
        $get_seller = "select * from sellers where seller_email='$seller_session'";
        
        $run_seller = mysqli_query($con,$get_seller);
        
        $row_seller = mysqli_fetch_array($run_seller);
        
        $seller_id = $row_seller['seller_id'];
        
        $seller_name = $row_seller['seller_name'];
        
        $seller_email = $row_seller['seller_email'];
        
        $seller_image = $row_seller['seller_image'];
        
        $seller_country = $row_seller['seller_country'];
        
        $seller_about = $row_seller['seller_about'];
        
        $seller_contact = $row_seller['seller_contact'];
        
        $seller_job = "Seller";
        
        $get_products = "select * from products where s_id='$seller_id'";
        
        $run_products = mysqli_query($con,$get_products);
        
        $count_products = mysqli_num_rows($run_products);
        
        $get_customers = "select * from customers";
        
        $run_customers = mysqli_query($con,$get_customers);
        
        $count_customers = mysqli_num_rows($run_customers);
        
        $get_p_categories = "select * from product_categories";
        
        $run_p_categories = mysqli_query($con,$get_p_categories);
        
        $count_p_categories = mysqli_num_rows($run_p_categories);
        
        $get_pending_orders = "select * from pending_orders where s_id='$seller_id'";
        
        $run_pending_orders = mysqli_query($con,$get_pending_orders);
        
        $count_pending_orders = mysqli_num_rows($run_pending_orders);

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
</head>
<body>

    <div id="wrapper"><!-- #wrapper begin -->
       
       <?php include("includes/sidebar.php"); ?>
       
        <div id="page-wrapper"><!-- #page-wrapper begin -->
            <div class="container-fluid"><!-- container-fluid begin -->
                
                <?php
                
                    if(isset($_GET['dashboard'])){
                        
                        include("dashboard.php");
                        
                }   if(isset($_GET['insert_product'])){
                        
                        include("insert_product.php");
                        
                }   if(isset($_GET['view_products'])){
                        
                        include("view_products.php");
                        
                }   if(isset($_GET['delete_product'])){
                        
                        include("delete_product.php");
                        
                }   if(isset($_GET['edit_product'])){
                        
                        include("edit_product.php");
                        
                }   if(isset($_GET['view_orders'])){
                        
                        include("view_orders.php");
                        
                }   if(isset($_GET['delete_order'])){
                        
                        include("delete_order.php");
                        
                }   if(isset($_GET['view_payments'])){
                        
                        include("view_payments.php");
                        
                }   if(isset($_GET['delete_payment'])){
                        
                        include("delete_payment.php");
                        
                }   if(isset($_GET['user_profile'])){
                        
                        include("user_profile.php");
                        
                }   if(isset($_GET['s_results'])){
                        
                        include("s_results.php.php");
                        
                }
        
                ?>
                
            </div><!-- container-fluid finish -->
        </div><!-- #page-wrapper finish -->
    </div><!-- wrapper finish -->

<script src="js/jquery-331.min.js"></script>     
<script src="js/bootstrap-337.min.js"></script>           
</body>
</html>


<?php } ?>