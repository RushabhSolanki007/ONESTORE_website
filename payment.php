<?php 

include("includes/db.php");
include("functions/functions.php");
 
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, 'https://test.instamojo.com/api/1.1/payment-requests/');
curl_setopt($ch, CURLOPT_HEADER, FALSE);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
curl_setopt($ch, CURLOPT_HTTPHEADER,
    array("X-Api-Key:test_4d01b8fe4762eeee2cdcdd25e38",
                  "X-Auth-Token:test_bc6b5f6a75668ce70678cc49491"));

if(isset($_GET['c_id'])){
    
    $customer_id = $_GET['c_id'];
    
}

$get_customer = "select * from customers where customer_id='$customer_id'";

$run_customer = mysqli_query($con,$get_customer);

while($row_customer = mysqli_fetch_array($run_customer))
{
    $customer_name = $row_customer['customer_name'];

    $customer_email = $row_customer['customer_email'];

    $customer_ip = $row_customer['customer_ip'];
}

$get_cart = "select * from cart where ip_add='$customer_ip'";

$run_cart = mysqli_query($con,$get_cart);

while($row_cart = mysqli_fetch_array($run_cart))
{
    $p_id = $row_cart['p_id'];

    $qty = $row_cart['qty'];

    $get_product = "select * from products where product_id='$p_id'";

    $run_product = mysqli_query($con,$get_product);

    $count = 0;

    while($row_product = mysqli_fetch_array($run_product))
    {
        $product_title = $row_product['product_title'];

        $product_pri = $row_product['product_price'];

        $product_sale = $row_product['product_sale'];

        $product_price_total = $product_pri*$qty;

        $count = $count + 1;

        for ($i = 0; $i < $count; $i++) {
            $pro_title = $pro_title."/\n".$product_title;
        }

        for ($i = 0; $i < $count; $i++) {
            $product_price = $product_price + $product_price_total;
        }

    }

    if(!$product_sale==0)
    {
        $product_price = $product_sale*$qty;
    }
}


// while($product_title == )
// {
//     $pro_title = $pro_title + $product_title;
// }

// for ($i = 0; $i < $count; $i++) {
//     $pro_title = $pro_title."/".$product_title;
// }


$payload = Array(
        "purpose" => "$pro_title ",
        "amount" => "$product_price",
        "phone" => "",
        "send_email" => true,
        "email" => "$customer_email",
        "buyer_name" => "$customer_name",
        "allow_repeated_payments" => false,
       "redirect_url" => "http://localhost/one%20store/success.php?c_id=$customer_id",
       //"webhook" => "http://localhost/one%20store/success.php"
    );
  


curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload));
$response = curl_exec($ch);
curl_close($ch); 


$decode = json_decode($response);
$paymenturl = $decode->payment_request->longurl;
header("Location:$paymenturl")

?>






