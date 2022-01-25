
    <?php
session_start();
include("../db.php");

error_reporting(0);
if(isset($_GET['action']) && $_GET['action']!="" && $_GET['action']=='delete')
{
$id=$_GET['id'];

/*this is delet query*/
mysqli_query($con,"delete from order_products where order_pro_id='$id'")or die("delete query is incorrect...");
} 

///pagination
$page=$_GET['page'];

if($page=="" || $page=="1")
{
$page1=0;	
}
else
{
$page1=($page*10)-10;	
}

include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <!-- your content here -->
          <div class="col-md-14">
            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Orders  / Page <?php echo $page;?> </h4>
              </div>
              <div class="card-body">
                <div class="table-responsive ps">
                  <table class="table table-hover tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
					  <th>Customer Name</th>
					  <th>Products</th>
					  <th>Contact | Email</th>
					  <th>Address</th>
					  <th>Price</th>
					  <th>Quantity</th>
					  <th>Time</th>
					   <th>Action</th>
                    </tr>
					</thead>
                    <tbody>
                      <?php 
					  
						$user_id = $_SESSION["uid"];
					  
					  $sqlll = "select order_pro_id,a.order_id, product_title, first_name, mobile, d.email, address1, address2, product_price,address2, qty, odr_time from orders_info a,order_products b, products c,user_info d where a.order_id=b.order_id and b.product_id = c.product_id and a.user_id=d.user_id";


                        
						
						$result=mysqli_query($con,$sqlll)or die ("query 1 incorrect.....");
						
						

                        while(list($order_pro_id,$order_id,$p_names,$cus_name,$contact_no,$email,$address,$country,$details,$zip_code,$quantity,$time)=mysqli_fetch_array($result))
                        {	
                        echo "<tr>
						<td>$cus_name</td>
						<td>$p_names</td>
						<td>$contact_no<br>$email</td>
						<td>$address<br>ZIP: $zip_code<br>$country</td>
						<td>$details</td>
						<td>$quantity</td>
						<td>$time</td>
					

                        <td>
                        <a class=' btn btn-danger' href='orders.php?id=$order_pro_id&action=delete'>Cancel</a>
                        </td>
						</tr>";
                        }
                        ?>
                    </tbody>
                  </table>
                  
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      <?php
include "footer.php";
?>