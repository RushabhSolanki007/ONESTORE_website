<?php 
    use PHPMailer\PHPMailer\PHPMailer;
        
    use PHPMailer\PHPMailer\Exception;
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
           <h2 class="form-login-heading"> Forget Password </h2>
           
           <input type="text" class="form-control" placeholder="Email Address" name="seller_email" required>
           
           
          

           <button type="submit" class="btn btn-lg btn-primary btn-block" name="submit"><!-- btn btn-lg btn-primary btn-block begin -->
               
               Submit
               
           </button><!-- btn btn-lg btn-primary btn-block finish -->

          
       </form><!-- form-login finish -->
   </div><!-- container finish -->
    
</body>
</html>


<?php 
                
    if(isset($_POST['submit']))
    {
         $get_email ="select * from sellers";
         $email = $_POST['seller_email'];
         $selectquery = mysqli_query($con,"select * from sellers where seller_email ='{$email}'") or die(mysqli_error($con));
        
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
        $mail->Body    = "Welcome {$row['seller_name']} seller Your Password is {$row['seller_pass']}";
        $mail->AltBody = "Welcome {$row['seller_name']} seller Your Password is {$row['seller_pass']}";

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