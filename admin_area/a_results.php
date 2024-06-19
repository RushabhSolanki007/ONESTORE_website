<?php 

    include("includes/header.php");
    include("includes/db.php");

    $user_search = $_GET['user_query'];

?>

<?php include("index.php"); ?>
<div class="a_results">
<div class="row"><!-- row 1 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <ol class="breadcrumb"><!-- breadcrumb begin -->
            <li class="active"><!-- active begin -->
                
                <i class="fa fa-dashboard"></i> Dashboard / View Products
                
            </li><!-- active finish -->
        </ol><!-- breadcrumb finish -->
    </div><!-- col-lg-12 finish -->
</div><!-- row 1 finish -->

<form method="get" action="a_results.php" class="navbar-form"><!-- navbar-form Begin -->
                       
   <div class="input-group"><!-- input-group Begin -->
       
       <input type="text" class="form-control" placeholder="Search" name="user_query" required>
       
       <span class="input-group-btn"><!-- input-group-btn Begin -->
       
       <button type="submit" name="search" value="Search" class="btn btn-primary"><!-- btn btn-primary Begin -->
           
           <i class="fa fa-search"></i>
           
       </button><!-- btn btn-primary Finish -->
       
       </span><!-- input-group-btn Finish -->
       
   </div><!-- input-group Finish -->
   
</form><!-- navbar-form Finish -->

<div class="row"><!-- row 2 begin -->
    <div class="col-lg-12"><!-- col-lg-12 begin -->
        <div class="panel panel-default"><!-- panel panel-default begin -->
            <div class="panel-heading"><!-- panel-heading begin -->
               <h3 class="panel-title"><!-- panel-title begin -->
               
                   <i class="fa fa-tags"></i>  View Products
                
               </h3><!-- panel-title finish --> 
            </div><!-- panel-heading finish -->
            
            <div class="panel-body"><!-- panel-body begin -->
                <div class="table-responsive"><!-- table-responsive begin -->
                    <table class="table table-striped table-bordered table-hover"><!-- table table-striped table-bordered table-hover begin -->
                        
                        <thead><!-- thead begin -->
                            <tr><!-- tr begin -->
                                <th> Product ID: </th>
                                <th> Product Title: </th>
                                <th> Product Image: </th>
                                <th> Product Price: </th>
                                <th> Product Sold: </th>
                                <th> Product Quantity: </th>
                                <th> Product Keywords: </th>
                                <th> Product Date: </th>
                                <th> Product Delete: </th>
                                <th> Product Edit: </th>
                            </tr><!-- tr finish -->
                        </thead><!-- thead finish -->
                        
                        <tbody><!-- tbody begin -->
                            
                            <?php 

                                $search_value = $_GET['user_query'];

                                global $db;
                                $aWhere = array();  


                                $per_page=1;

                                if(isset($_GET['page'])){

                                    $page = $_GET['page'];

                                }else{
                                    $page=1;
                                }

                                $start_from = ($page-1) * $per_page;
                                $sLimit = " order by 1 DESC LIMIT $start_from,$per_page";
                                $sWhere = (count($aWhere)>0?' WHERE '.implode(' or ',$aWhere):'').$sLimit;
                                $get_products = "select * from products ".$sWhere;
                                $run_products = mysqli_query($con,$get_products);
                                while($row_products=mysqli_fetch_array($run_products)){
                                    $i=0;

                                    $get_s_pro = "select * from products where product_title like '%$search_value%' OR product_keywords like '%$search_value%' ORDER BY product_id ASC";

                                    $run_s_pro = mysqli_query($con,$get_s_pro);

                                    while($row_s_pro = mysqli_fetch_array($run_s_pro))
                                    {
                                    

                                        $pro_id = $row_s_pro['product_id'];
                                    
                                        $pro_title = $row_s_pro['product_title'];
                                        
                                        $pro_price = $row_s_pro['product_price'];
                                        
                                        $pro_img1 = $row_s_pro['product_img1'];

                                        $pro_quantity = $row_s_pro['product_quantity'];

                                        $pro_keywords = $row_s_pro['product_keywords'];

                                        $pro_date = $row_s_pro['date'];

                                        $i++;
                                        
                            
                            ?>
                            
                            <tr><!-- tr begin -->
                                <td> <?php echo $i; ?> </td>
                                <td> <?php echo $pro_title; ?> </td>
                                <td> <img src="../admin_area/product_images/<?php echo $pro_img1; ?>" width="60" height="60"></td>
                                <td> ₹ <?php echo $pro_price; ?> </td>
                                <td> <?php 
                                    
                                        $get_sold = "select * from pending_orders where product_id='$pro_id'";
                                    
                                        $run_sold = mysqli_query($con,$get_sold);
                                    
                                        $count = mysqli_num_rows($run_sold);
                                    
                                        echo $count;
                                    
                                     ?> 
                                </td>
                                <td> <?php echo $pro_quantity; ?> </td>
                                <td> <?php echo $pro_keywords; ?> </td>
                                <td> <?php echo $pro_date ?> </td>
                                <td> 
                                     
                                     <a href="index.php?delete_product=<?php echo $pro_id; ?>">
                                     
                                        <i class="fa fa-trash-o"></i> Delete
                                    
                                     </a> 
                                     
                                </td>
                                <td> 
                                     
                                     <a href="index.php?edit_product=<?php echo $pro_id; ?>">
                                     
                                        <i class="fa fa-pencil"></i> Edit
                                    
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
</div>

<?php } ?>