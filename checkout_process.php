<?php
session_start();
include "db.php";
include "SMSSenderApi.php";
include "mail.php";
if (isset($_SESSION["uid"])) {

	$f_name = $_POST["firstname"];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $zip= $_POST['zip'];
    $cardname= $_POST['cardname'];
    $cardnumber= $_POST['cardNumber'];
    $expdate= $_POST['expdate'];
    $cvv= $_POST['cvv'];
    $user_id=$_SESSION["uid"];
    $cardnumberstr=(string)$cardnumber;
    $total_count=$_POST['total_count'];
    $prod_total = $_POST['total_price'];
    
    
    $sql0="SELECT order_id from `orders_info`";
    $runquery=mysqli_query($con,$sql0);
    if (mysqli_num_rows($runquery) == 0) {
        echo( mysqli_error($con));
        $order_id=1;
    }else if (mysqli_num_rows($runquery) > 0) {
        $sql2="SELECT MAX(order_id) AS max_val from `orders_info`";
        $runquery1=mysqli_query($con,$sql2);
        $row = mysqli_fetch_array($runquery1);
        $order_id= $row["max_val"];
        $order_id=$order_id+1;
        echo( mysqli_error($con));
    }

	$sql = "INSERT INTO `orders_info` 
	(`order_id`,`user_id`,`f_name`, `email`,`address`, 
	`city`, `state`, `zip`, `cardname`,`cardnumber`,`expdate`,`prod_count`,`total_amt`,`cvv`) 
	VALUES ($order_id, '$user_id','$f_name','$email', 
    '$address', '$city', '$state', '$zip','$cardname','$cardnumberstr','$expdate','$total_count','$prod_total','$cvv')";


    if(mysqli_query($con,$sql)){
       
        $total_n = count($_POST['product_title']);
					
					$product_title = $_POST['product_title'];
					
					$product_id= $_POST['product_id'];
					
					//$cart_item_id= $_POST['cart_item_id'];
					$qty= $_POST['qty'];
					$total_price= $_POST['t_price'];
					
		for($ii=0;$ii<$total_n;$ii++){
			
			
           
            
            $prod_id=$product_id[$ii];	           
            $prod_qty=$qty[$ii];
            $sub_total=$total_price[$ii];
			$p_title = $product_title[$ii];
			
			
			
			
			
			
			
			
			
$curStock = 0;			
$sql_p = "SELECT * FROM `products` WHERE `product_id`='$prod_id'";
$result_p = mysqli_query($con, $sql_p);

if (mysqli_num_rows($result_p) > 0) {
  // output data of each row
  while($row_p = mysqli_fetch_assoc($result_p)) {
   $curStock = $row_p["product_stock"];
   $curPid = $row_p["product_id"];
  } 
}

$nowStock = $curStock - $prod_qty;

$sql = "UPDATE `products` SET `product_stock` = '$nowStock' WHERE `products`.`product_id` = '$curPid';";
mysqli_query($con, $sql);

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
            $sql1="INSERT INTO `order_products` 
            (`order_pro_id`,`order_id`,`product_id`,`qty`,`amt`) 
            VALUES (NULL, '$order_id','$prod_id','$prod_qty','$sub_total')";
			
			//echo $sql1;
			
			mysqli_query($con,$sql1);
			$o_id = $con->insert_id;
			
			$sms = new SMSSenderApi();
					$sms->toNumber($phone);
					$msg= "Dear ".$f_name."\n Thank you for ordering from Krishi Bazar. \nOrder No #".$o_id."\nProduct Name: ".$p_title."\nQuantity: ".$prod_qty."\nAmount: ".$sub_total."" ;
					$sms->message($msg);
					$sms->send();
					
					$mail->addAddress($email, $f_name);
					$mail->msgHTML($msg);
					$mail->send();
			
           


        }
		$del_sql="DELETE from cart where user_id=$user_id";
		mysqli_query($con,$del_sql);
		$_SESSION["order_confirm"] = "Your order successfully placed";
		 echo"<script>window.location.href='store.php'</script>";
		
    }else{

        echo(mysqli_error($con));
        
    }
    
}else{
    echo"<script>window.location.href='index.php'</script>";
}
	




?>