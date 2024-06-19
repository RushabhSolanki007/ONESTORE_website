<?php 
    
    if(!isset($_SESSION['admin_email'])){
        
        echo "<script>window.open('login.php','_self')</script>";
        
    }else{

?>

<div class="row"><!-- row 1 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <ol class="breadcrumb"><!-- breadcrumb begin -->
            <li class="active"><!-- active begin -->
                
                <i class="fa fa-dashboard"></i> Dashboard / Sellers
                
            </li><!-- active finish -->
        </ol><!-- breadcrumb finish -->
    </div><!-- col-lg-12 finish -->
</div><!-- row 1 finish -->

<div class="row"><!-- row 2 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <div class="panel panel-default"><!-- panel panel-default begin -->
            <div class="panel-heading"><!-- panel-heading begin -->
               <h3 class="panel-title"><!-- panel-title begin -->
               
                   <i class="fa fa-tags"></i>  View Sellers
                
               </h3><!-- panel-title finish --> 
            </div><!-- panel-heading finish -->
            
            <div class="panel-body"><!-- panel-body begin -->
                <div class="table-responsive"><!-- table-responsive begin -->
                    <table class="table table-striped table-bordered table-hover"><!-- table table-striped table-bordered table-hover begin -->
                        
                        <thead><!-- thead begin -->
                            <tr><!-- tr begin -->
                                <th> No: </th>
                                <th> Name: </th>
                                <th> Image: </th>
                                <th> E-Mail: </th>
                                <th> Country: </th>
                                <th> Shop Address: </th>
                                <th> Contact: </th>
                                <th> View Products: </th>
                                <th> Delete: </th>
                            </tr><!-- tr finish -->
                        </thead><!-- thead finish -->
                        
                        <tbody><!-- tbody begin -->
                            
                            <?php 
          
                                $i=0;
                            
                                $get_s = "select * from sellers";
                                
                                $run_s = mysqli_query($con,$get_s);
          
                                while($row_s=mysqli_fetch_array($run_s)){
                                    
                                    $s_id = $row_s['seller_id'];
                                    
                                    $s_name = $row_s['seller_name'];
                                    
                                    $s_img = $row_s['seller_image'];
                                    
                                    $s_email = $row_s['seller_email'];
                                    
                                    $s_country = $row_s['seller_country'];
                                    
                                    $s_address = $row_s['seller_shop_address'];
                                    
                                    $s_contact = $row_s['seller_contact'];
                                    
                                    $i++;
                            
                            ?>
                            
                            <tr><!-- tr begin -->
                                <td> <?php echo $i; ?> </td>
                                <td> <?php echo $s_name; ?> </td>
                                <td> <img src="../seller_area/seller_images/<?php echo $s_img; ?>" width="60" height="60"></td>
                                <td> <?php echo $s_email; ?> </td>
                                <td> <?php echo $s_country; ?></td>
                                <td> <?php echo $s_address ?> </td>
                                <td> <?php echo $s_contact ?> </td>
                                <td> 
                                     
                                     <a href="index.php?view_seller_products=<?php echo $s_id; ?>">
                                     
                                        <i class="fa fa-fw fa-tag"></i> products
                                    
                                     </a> 
                                     
                                </td>
                                <td> 
                                     
                                     <a href="index.php?delete_seller=<?php echo $s_id; ?>">
                                     
                                        <i class="fa fa-trash-o"></i> Delete
                                    
                                     </a> 
                                     
                                </td>
                            </tr><!-- tr finish -->
                            
                            <?php } ?>
                            
                        </tbody><!-- tbody finish -->
                        
                    </table><!-- table table-striped table-bordered table-hover finish -->
                </div><!-- table-responsive finish -->
            </div><!-- panel-body finish -->
            
        </div><!-- panel panel-default finish -->
    </div><!-- col-lg-12 finish -->
</div><!-- row 2 finish -->

<?php } ?>