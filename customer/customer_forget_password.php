<?php 
    use PHPMailer\PHPMailer\PHPMailer;
        
    use PHPMailer\PHPMailer\Exception;
    $active='Account';
    include("includes/header.php");

?>
<form action="" method="post">
<div class="container"><!-- container Begin -->
           <div class="col-md-12"><!-- col-md-12 Begin -->
               
               <ul class="breadcrumb"><!-- breadcrumb Begin -->
                   <li>
                       <a href="http://localhost/one%20store/index.php">Home</a>
                   </li>
                   <li>
                       Forget PassWord
                   </li>
               </ul><!-- breadcrumb Finish -->
               
           </div><!-- col-md-12 Finish -->
           
           <div class="col-md-12"><!-- col-md-12 Begin -->
               
               <div class="box"><!-- box Begin -->
                   
                    <div class="box-header"><!-- box-header Begin -->

                        <center><!-- center Begin -->
                          <form method="post" action="checkout.php">
                          <h1> Forget Password </h1>
                                                                                               
                        </center>

                    </div>

                    <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Email</label>
                               
                               <input type="email" class="form-control" name="c_email" required>
                               
                    </div><!-- form-group Finish -->   

                    </form>               
                    
                    <div class="text-center"><!-- text-center Begin -->
                               
                               <button name="submit" value="submit" class="btn btn-primary">
                               
                               <i class="fa fa-user-md">  Submit  </i> 
                               
                               </button>
                           
                    <?php
                    
    if(isset($_POST['submit']))
    {
         $get_email ="select * from customers";
         $email = $_POST['c_email'];
         $selectquery = mysqli_query($con,"select * from customers where customer_email ='{$email}'") or die(mysqli_error($con));
        
        $count = mysqli_num_rows($selectquery);
        

    $count = mysqli_num_rows($selectquery);
    $row = mysqli_fetch_array($selectquery);

    if($count>0)
    {
        //echo $row['password'];
        


        //Load Composer's autoloader
        require 'vendor/autoload.php';

        //Create an instance; passing `true` enables exceptions
        $mail = new PHPMailer(true);

        try {
        //Server settings
        $mail->SMTPDebug = 0;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'onestore7000@gmail.com';                     //SMTP username
        $mail->Password   = 'onestore@123';                               //SMTP password
        $mail->SMTPSecure = 'tls';            //Enable implicit TLS encryption
        $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

         //Recipients
        $mail->setFrom('onestore7000@gmail.com', 'Onestore');
        $mail->addAddress($email, $email);     //Add a recipient
        

        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = 'Forget Password';
        $mail->Body    = "hii {$row['customer_name']} Your Password is {$row['customer_pass']}";
        $mail->AltBody = "hii {$row['customer_name']} Your Password is {$row['customer_pass']}";

         $mail->send();
        echo"<script>alert('Password Is Sent In your Email')</script>";
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
          }
        }
        else{

            echo"<script>alert('Email Not Found')</script>";
        }

}


?>
                               
                    </div>
                </div>
            </div>
</div>
<?php 
    
    include("includes/footer.php");
    
?>