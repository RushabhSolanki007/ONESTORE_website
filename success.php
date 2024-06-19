<!-- <!DOCTYPE html>
<html>
<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title></title>
</head>
<body> -->

<?php
      session_start();
      require("instramojo/src/instamojo.php");
      include("includes/db.php");
      include("functions/functions.php");

      $api = new Instamojo\Instamojo('test_4d01b8fe4762eeee2cdcdd25e38',' test_bc6b5f6a75668ce70678cc49491', 'https://test.instamojo.com/api/1.1/',);


      if(isset($_GET['c_id'])){
          
          $customer_id = $_GET['c_id'];

          $ip_add = getRealIpUser();

          $status = "Complete";

          $invoice_no = mt_rand();

          $select_cart = "select * from cart where ip_add='$ip_add'";

          $run_cart = mysqli_query($con,$select_cart);

          while($row_cart = mysqli_fetch_array($run_cart)){

            $pro_id = $row_cart['p_id'];
    
            $pro_qty = $row_cart['qty'];
    
            $pro_size = $row_cart['size'];
        
            $sub_total = $row_cart['p_price']*$pro_qty;

            $get_seller_id = "select * from products where product_id='$pro_id'";

            $run_seller_id = mysqli_query($con,$get_seller_id);

            while($row_seller_id = mysqli_fetch_array($run_seller_id))
            {

                  $s_id = $row_seller_id['s_id'];

            }
    
            $insert_customer_order = "insert into customer_orders (customer_id,s_id,due_amount,invoice_no,qty,size,order_date,order_status) values ('$customer_id','$s_id','$sub_total','$invoice_no','$pro_qty','$pro_size',NOW(),'$status')";
    
            $run_customer_order = mysqli_query($con,$insert_customer_order);
    
            $insert_pending_order = "insert into pending_orders (customer_id,s_id,invoice_no,product_id,qty,size,order_status) values ('$customer_id','$s_id','$invoice_no','$pro_id','$pro_qty','$pro_size','$status')";
    
            $run_pending_order = mysqli_query($con,$insert_pending_order);
    
            $delete_cart = "delete from cart where ip_add='$ip_add'";
    
            $run_delete = mysqli_query($con,$delete_cart);

            $get_products = "select * from products where product_id='$pro_id'";

            $run_products = mysqli_query($con,$get_products);

            while($row_products = mysqli_fetch_array($run_products))
            {
                  $product_quantity = $row_products['product_quantity'];

            }

            $product_quantity = $product_quantity - $pro_qty;

            $update_product = "update products set product_quantity='$product_quantity' where product_id='$pro_id'";

            $run_update = mysqli_query($con,$update_product);







          $get_orders = "select * from customer_orders where customer_id='$customer_id'";

          $run_orders = mysqli_query($con,$get_orders);

          while($row_orders = mysqli_fetch_array($run_orders)){
                
                $order_id = $row_orders['order_id'];
          }

          $get_orders = "select * from customer_orders where order_id='$order_id'";

          $run_orders = mysqli_query($con,$get_orders);

          while($row_orders = mysqli_fetch_array($run_orders))
          {
              $due_amount = $row_orders['due_amount'];

              $invoice_no = $row_orders['invoice_no'];


          }

          $payment_mode = "instramojo";

          $payment_id=$_GET['payment_id'];

          $payment_re_id=$_GET['payment_request_id'];

          $complete = "Complete";

          $insert_payment = "insert into payments (invoice_no,amount,payment_mode,ref_no,code,payment_date) values ('$invoice_no','$due_amount','$payment_mode','$payment_re_id','$payment_id',NOW())";

          $run_payment = mysqli_query($con,$insert_payment);

          $update_customer_order = "update customer_orders set order_status='$complete' where order_id='$order_id'";

          $run_customer_order = mysqli_query($con,$update_customer_order);

          $update_pending_order = "update pending_orders set order_status='$complete' where order_id='$order_id'";

          $run_pending_order = mysqli_query($con,$update_pending_order);

          if($run_pending_order){
                            
                echo "<script>alert('Your Order placed successfully')</script>";
                
                echo "<script>window.open('customer/my_account.php?my_orders','_self')</script>";
                
            }
          
           } 
      }

      try {
            $payment_re_id=$_GET['payment_request_id'];
            $payment_id=$_GET['payment_id'];
            $response = $api->paymentRequestPaymentStatus($payment_re_id,$payment_id);
            
            $status=$response['status'];
            $amount=$response['amount'];

            if(strcmp($status,'Failed')==0){

                  echo('Failed');
            }
            //else{
                  
                  //echo "<script>alert('Your Order placed successfully')</script>";
        
                  //echo "<script>window.open('index.php','_self')</script>";

                  // echo '<h1>Order placed successfully</h1>';
                  // echo '</br>payment Id: '.$payment_id; 
                  // echo '</br>Amount:'.$amount; 
                  // echo '</br>Status:'.$status;



            //}
      }
            catch (Exception $e) {
            print('Error: ' . $e->getMessage());
      }

// $status=$response['status'];
// if($status='Completed')

//       if(isset($_GET['c_id'])){
          
//           $customer_id = $_GET['c_id'];
          
//       }
      

//       $ip_add = getRealIpUser();

//       $status = "Pending";

//       $invoice_no = mt_rand();

//       $select_cart = "select * from cart where ip_add='$ip_add'";

//       $run_cart = mysqli_query($con,$select_cart);

//       while($row_cart = mysqli_fetch_array($run_cart)){
          
//           $pro_id = $row_cart['p_id'];
          
//           $pro_qty = $row_cart['qty'];
          
//           $pro_size = $row_cart['size'];
              
//           $sub_total = $row_cart['p_price']*$pro_qty;
          
//           $insert_customer_order = "insert into customer_orders (customer_id,due_amount,invoice_no,qty,size,order_date,order_status) values ('$customer_id','$sub_total','$invoice_no','$pro_qty','$pro_size',NOW(),'$status')";
          
//           $run_customer_order = mysqli_query($con,$insert_customer_order);

//           $insert_pending_order = "insert into pending_orders (customer_id,invoice_no,product_id,qty,size,order_status) values ('$customer_id','$invoice_no','$pro_id','$pro_qty','$pro_size','$status')";
          
//           $run_pending_order = mysqli_query($con,$insert_pending_order);

//           if($run_pending_order)
//           {
//               echo 'update pending_orders';

//           }

          
//           $delete_cart = "delete from cart where ip_add='$ip_add'";
          
//           $run_delete = mysqli_query($con,$delete_cart);


//           $get_products = "select * from products where product_id='$pro_id'";

//           $run_products = mysqli_query($con,$get_products);

//           while($row_products = mysqli_fetch_array($run_products))
//           {
//               $product_quantity = $row_products['product_quantity'];

//           }

//           $product_quantity = $product_quantity - $pro_qty;

//           $update_product = "update products set product_quantity='$product_quantity' where product_id='$pro_id'";

//           $run_update = mysqli_query($con,$update_product);
          
//               //echo "<script>window.open('customer/my_account.php?my_orders','_self')</script>";
          
//       }

      



?>
<!-- </body>
</html> -->