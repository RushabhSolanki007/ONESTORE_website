<?php 
    include("includes/db.php");

    if(isset($_GET['delete_order'])){
        
        $delete_order = $_GET['delete_order'];

        $get_order = "select * from pending_orders where order_id='$delete_order'";

        $run_order = mysqli_query($con,$get_order);

        while($row_order = mysqli_fetch_array($run_order))
        {
            $pro_id = $row_order['product_id'];

            $pro_qty = $row_order['qty'];

            $get_products = "select * from products where product_id='$pro_id'";

            $run_products = mysqli_query($con,$get_products);

            while($row_products = mysqli_fetch_array($run_products))
            {
                $product_quantity = $row_products['product_quantity'];

            }

            $product_quantity = $product_quantity + $pro_qty;

            $update_product = "update products set product_quantity='$product_quantity' where product_id='$pro_id'";

            $run_update = mysqli_query($con,$update_product);
    
        }
        
        $delete_c_order = "delete from customer_orders where order_id='$delete_order'";
        
        $run_c_delete = mysqli_query($con,$delete_c_order);

        $delete_p_order = "delete from pending_orders where order_id='$delete_order'";
        
        $run_p_delete = mysqli_query($con,$delete_p_order);

        $get_order = "select * from pending_orders where order_id='$delete_order'";

        $run_order = mysqli_query($con,$get_order);

        if($run_c_delete && $run_p_delete && $run_update){
    
            echo "<script>alert('Your order has been Deleted')</script>";
            
            echo "<script>window.open('my_account.php?my_orders','_self')</script>";
    
        }
        
    }

?>